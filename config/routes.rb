Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/microposts', to: 'microposts#index'
  get    '/match', to: 'match#match'
  get    '/searchusers', to: 'search#searchUser'
  get    '/searchposts', to: 'search#searchPost'
  get   '/resets', to: 'resetpassword#reset'
  get    '/index', to: 'resetpassword#index'
  get    '/reset', to: 'resetpassword#reset'


  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
