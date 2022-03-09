Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items
  # resources :users, only: [:new]
end
