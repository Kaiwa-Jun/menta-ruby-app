Rails.application.routes.draw do
  root 'tops#index'
  delete 'logout'  => 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end