require 'lib/rails_controller_tracing/method_hooks'

class Object
  prepend RailsControllerTracing::MethodHooks
end
