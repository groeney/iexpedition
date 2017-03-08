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
  resources :order_items, only: [:create, :update, :destroy]
  resources :favourite_voyages, only: [:create, :destroy]
  resources :favourite_ships, only: [:create, :destroy]

  get "checkout/cabins/:cabin_grouping_id" => "checkout#cabins", as: :checkout_cabins
  get "checkout/extras" => "checkout#extras", as: :checkout_extras
  get "checkout/cart" => "checkout#cart"
  get "checkout/confirm" => "checkout#confirm"
  post "checkout/signup" => "checkout#signup"

  get "dashboard/home" => "dashboard#home"
  get "dashboard/personal_details" => "dashboard#personal_details"
  get "dashboard/order_history" => "dashboard#order_history"
  get "dashboard/confirmed_itinerary" => "dashboard#confirmed_itinerary"
  get "dashboard/wishlist" => "dashboard#wishlist"
  put "dashboard/update_details" => "dashboard#update_details"
  root "pages#home"
end
