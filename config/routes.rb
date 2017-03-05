Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: "confirmations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "search/voyages" => "search#voyages", as: :search_voyages
  get "search/arctic/voyages" => "search#arctic", as: :search_arctic_voyages
  get "search/antarctica/voyages" => "search#antarctica", as: :search_antarctica_voyages
  get "search/ships" => "search#ships", as: :search_ships
  get "search" => "pages#search"
  get "ship_listing" => "pages#ship_listing"
  resources :voyages, only: [:show]
  resources :destinations, only: [:show]
  resources :ships, only: [:show]
  get "dashboard/home" => "dashboard#home"
  root "pages#home"
end
