Rails.application.routes.draw do
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
