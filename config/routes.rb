Pinderhughes::Application.routes.draw do

  root to: 'pages#home'
  
  match '/about',    to: 'pages#about',    via: 'get'
  match '/calendar', to: 'pages#calendar', via: 'get'
  match '/listen',   to: 'pages#listen',   via: 'get'
  match '/watch',    to: 'pages#watch',    via: 'get'
  match '/contact',  to: 'pages#contact',  via: 'get'

  devise_for :users
  resources  :users do 
    resources  :social_media_sites
  end
  
  resources  :social_media_sites 
  resources  :tracks
  resources  :events
  resources  :videos, only: [:index, :show]
  resources  :blogs, only: [:index, :show]

  namespace :admin do
    resources :videos
    resources :blogs
  end
end
