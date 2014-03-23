Pinderhughes::Application.routes.draw do

  root to: 'pages#home'
  
  match '/about',    to: 'pages#about',    via: 'get'
  match '/calendar', to: 'pages#calendar', via: 'get'
  match '/listen',   to: 'pages#listen',   via: 'get'
  match '/watch',    to: 'pages#watch',    via: 'get'
  match '/contact',  to: 'pages#contact',  via: 'get'

  devise_for :users
  
  resources  :blogs, only: [:index, :show]
  resources  :events, only: [:index, :show]
  resources  :social_media_sites, only: [:index, :show] 
  resources  :tracks, only: [:index, :show]
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
