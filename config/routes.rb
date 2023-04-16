RailsControllerTracing::Engine.routes.draw do
  root to: 'tracing#index'
  get :clear, to: 'tracing#clear'
end
