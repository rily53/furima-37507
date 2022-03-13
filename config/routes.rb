Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :buyers, only: [:index, :create]
  end
  # resources :users, only: [:new]
end
