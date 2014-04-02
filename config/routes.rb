Pinderhughes::Application.routes.draw do

  root to: 'pages#home'
  
  match '/about',    to: 'users#show',    via: 'get'
  match '/calendar', to: 'events#index',  via: 'get'
  match '/listen',   to: 'tracks#index',  via: 'get'
  match '/watch',    to: 'videos#index',  via: 'get'
  match '/news',     to: 'blogs#index',   via: 'get'
  match '/contact',  to: 'pages#contact', via: 'get'

  devise_for :users
  
  resources  :blogs, only: [:index, :show]
  resources  :events, only: [:index, :show]
  resources  :social_media_sites, only: [:index, :show] 
  resources  :tracks, only: [:index, :show]
  resources  :users, only: [:show]
  resources  :videos, only: [:index, :show]

  get '/admin', to: 'admin/pages#home'
  namespace :admin do
    resources :blogs
    resources :events
    resources :social_media_sites
    resources :tracks
    resources :users
    resources :videos
  end
end
