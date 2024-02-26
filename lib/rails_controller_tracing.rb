require "rails_controller_tracing/version"
require "rails_controller_tracing/engine"
require "rails_controller_tracing/tracer"

module RailsControllerTracing
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      RailsControllerTracing::Tracer.current = Tracer.new

      result = []
      point_trace = TracePoint.new(:call) do |tp|
        if tp.path.to_s.include?(Rails.root.to_s)
          result << [tp.lineno, tp.path, tp.method_id]
        end
      end

      return_val = nil
      point_trace.enable do
        return_val = @app.call(env)
      end

      Rails.logger.info(result)

      return_val
    end
  end

  class Railtie < Rails::Railtie
    def self.insert_middleware
      initializer "middle.configure_rails_initialization" do |app|
        app.middleware.unshift Middleware
      end
    end
    insert_middleware
  end
end
