Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'posts#index'
  delete 'logout'  => 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  
  resources :sessions, only: [:new, :create]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]do
    resource :likes, only: [:create, :destroy]
  end
end