require "active_storage/engine"

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end

  mount ActiveStorage::Engine => "/rails/active_storage"
  mount ActiveAdmin::Engine => '/admin', as: 'active_admin'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins

  # Route all requests to React
  root to: 'homepage#index'
  resources :articles

  # 404 Rails page route
  # get '*path', to: 'no_page#index', constraints: ->(req) { !(req.fullpath =~ /^\/admin/) && !(req.fullpath =~ /^\/admin_users/) }
end
