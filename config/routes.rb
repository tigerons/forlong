Rails.application.routes.draw do

  resources :posts
  get 'users/index'
  get 'user/index'
  get 'friendships/index' => 'friendships#index'
  get 'friends/destroy'
  resources :friend_requests
  #root to: 'pages#home'
  resources :users
  devise_for :users, skip: [:registrations]
  devise_scope :user do
    authenticated :user do
      #get 'users/edit' => 'users/users_edit_path', :as => 'edit_user_path'
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get "/posts/edit" => "posts_path"

  #match '/users',   to: 'users#index',   via: 'get'
  post "/friendships/accept" => "friendships/accept"
  post "/friendships/remove" => "friendships/remove"
  post "/friendships/block" => "friendships/block"
  post "/friendships/unblock" => "friendships/unblock"
  post "/friendships/create" => "friendhsips/create"
  delete "/friendships/reject" => "friendships/reject"
  get "/users/blocked_users" => "users/blocked_users"
  #get "/users/edit" => "users/edit"
  get "/friendships/requested_friends" => "friendships/requested_friends"
  get "/friendships/friends_request" => "friendships/friends_requests"
  get "/friendships/reject" => "friendships/reject"
  get "/friendships/create" => "friendhsips/create"
  resources :friendships, only: [:index, :create]

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
