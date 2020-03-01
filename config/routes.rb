Rails.application.routes.draw do

  resources :posts
  get 'users/index'
  get 'user/index'
  get 'friendships/index' => 'friendships#index'
  get 'friends/destroy'
  resources :friend_requests
  root to: 'pages#home'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  match '/users',   to: 'users#index',   via: 'get'
  post "/friendships/accept" => "friendships/accept"
  post "/friendships/remove" => "friendships/remove"
  post "/friendships/block" => "friendships/block"
  post "/friendships/unblock" => "friendships/unblock"
  post "/friendships/create" => "friendhsips/create"
  delete "/friendships/reject" => "friendships/reject"
  get "/users/blocked_users" => "users/blocked_users"
  get "/friendships/requested_friends" => "friendships/requested_friends"
  get "/friendships/friends_request" => "friendships/friends_requests"
  get "/friendships/reject" => "friendships/reject"
  get "/friendships/create" => "friendhsips/create"
  resources :friendships, only: [:index, :create]
  resources :users
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
