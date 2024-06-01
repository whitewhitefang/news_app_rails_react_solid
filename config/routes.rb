Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins

  # Route all requests to React
  root to: 'homepage#index'
  get 'articles', to: 'articles#index'

  # 404 page route
  get '*path', to: 'homepage#no_page', constraints: ->(req) { !(req.fullpath =~ /^\/admin/) && !(req.fullpath =~ /^\/admin_users/) }
end
