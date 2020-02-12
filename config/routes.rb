Rails.application.routes.draw do
  get 'users/index'
  get 'user/index'
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  root to:  'pages#home'
  devise_for :users
  match '/users',   to: 'users#index',   via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
