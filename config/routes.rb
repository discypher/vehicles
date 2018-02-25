Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :options
      resources :models do
        resources :options, only: :index
      end
      resources :makes do
        resources :models, only: :index
        resources :vehicles, only: :index
      end
      resources :vehicles
    end
  end
end
