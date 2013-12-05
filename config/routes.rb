Rails3BootstrapDeviseCancan::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config

  authenticated :user do
    root :to => 'home#index'
  end
  resources :offers, :only=>[:index, :show]
  get 'page/:uri' => 'static_pages#show', :as => :page
  
  root :to => "home#index"
  devise_for :users
  ActiveAdmin.routes(self)
  resources :users
end