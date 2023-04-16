module RailsControllerTracing::TracingPrepend
  extend ActiveSupport::Concern

  included do
    prepend_around_action :controller_action_trace
  end

  def controller_action_trace(&block)
    raise 'Only intended to be used in development due to performance drawbacks.' unless Rails.env.development?

    ProcessTracer::Trace.new(&block).push_to_redis
  end
end
