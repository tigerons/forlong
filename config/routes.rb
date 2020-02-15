Rails.application.routes.draw do
  get 'users/index'
  get 'user/index'
  get 'friendships/index' => 'friendships#index'
  get 'friends/destroy'
  resources :friend_requests
  root to:  'pages#home'
  devise_for :users
  match '/users',   to: 'users#index',   via: 'get'
  resources :friendships, only: [:index, :create]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
