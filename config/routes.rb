Rails.application.routes.draw do
  get '/docs' => redirect('/swagger-ui/dist/index.html?url=/api-docs.json')

  namespace :api do
    namespace :v1 do
      jsonapi_resources :vehicles
      jsonapi_resources :options
      jsonapi_resources :models
      jsonapi_resources :makes
    end
  end
end
