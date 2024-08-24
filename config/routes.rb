Rails.application.routes.draw do
  root 'posts#index'
  delete 'logout'  => 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:index, :new, :create]
end