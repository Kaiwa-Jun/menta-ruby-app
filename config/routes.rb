Rails.application.routes.draw do
  root 'posts#index'
  delete 'logout'  => 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end