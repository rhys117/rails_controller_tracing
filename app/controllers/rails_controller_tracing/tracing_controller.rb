module RailsControllerTracing
  class TracingController < ActionController::Base
    def index
      render json: ProcessTracer::RedisService.fetch_all
    end

    def clear
      render json: ProcessTracer::RedisService.flush_db!
    end
  end
end
