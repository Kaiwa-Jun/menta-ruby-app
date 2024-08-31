Rails.application.routes.draw do
  root 'posts#index'
  delete 'logout'  => 'sessions#destroy', as: :logout
  # delete 'post_path'  => 'posts#destroy', as: :post_delete
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end