Rails.application.routes.draw do
  resources :posts
  get 'users/index'
  get 'user/index'
  get 'friendships/index' => 'friendships#index'
  get 'friends/destroy'
  resources :friend_requests
  root to:  'pages#home'
  devise_for :users
  match '/users',   to: 'users#index',   via: 'get'
  post "/friendships/accept" => "friendships/accept"
  post "/friendships/remove" => "friendships/remove"
  post "/friendships/block" => "friendships/block"
  post "/friendships/unblock" => "friendships/unblock"
  post "/friendships/reject" => "friendships/reject"
  get "/users/blocked_users" => "users/blocked_users"
  get "/friendships/requested_friends" => "friendships/requested_friends"
  resources :friendships, only: [:index, :create]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
