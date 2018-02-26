Rails.application.routes.draw do
  get '/docs' => redirect('/swagger-ui/dist/index.html?url=/api-docs.json')

  scope module: 'api' do
    namespace :v1 do
      resources :vehicles
      resources :options
      resources :models do
        resources :options, only: :index
        resources :vehicles, only: :index
      end
      resources :makes do
        resources :models, only: :index
      end
    end
  end
end
