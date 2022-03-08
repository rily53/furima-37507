Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  # resources :users, only: [:new]
end
