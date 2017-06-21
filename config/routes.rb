Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/map'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :locations
  resources :categories, :only => [:index]
  resources :alert_tags, :only => [:index]
  resources :events, :only => [:index,:create]
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root to: "admin/dashboard#index"
end
