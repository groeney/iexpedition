Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "chewbacca" => "pages#chewbacca"
  get "search" => "pages#search"
  get "ship_listing" => "pages#ship_listing"
  get "bug" => "pages#bug"
  resources :voyages, only: [:show]
  root "pages#home"
end
