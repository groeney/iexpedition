Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: "confirmations",
    sessions: "sessions",
    omniauth_callbacks: "omniauth_callbacks"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "search/voyages" => "search#voyages", as: :search_voyages
  get "search/arctic/voyages" => "search#arctic", as: :search_arctic_voyages
  get "search/antarctica/voyages" => "search#antarctica", as: :search_antarctica_voyages
  get "search/ships" => "search#ships", as: :search_ships
  get "search" => "pages#search"
  get "ship_listing" => "pages#ship_listing"
  get "wishlist" => "pages#wishlist"
  get "contact_us" => "pages#contact_us"
  get "travel_resources" => "pages#travel_resources"
  get "expedition_travel" => "pages#expedition_travel"
  post "contact/create" => "contact_requests#create", as: :create_contact
  get "arctic" => "pages#arctic_page"
  get "about" => "pages#about_us"
  get "about_us" => "pages#about_us"
  resources :voyages, only: [:show]
  get "destination/antarctica" => "destinations#antarctica", as: :destination_antarctica
  get "destination/the-arctic" => "destinations#arctic", as: :destination_arctic
  resources :destinations, only: [:show]
  resources :ships, only: [:show]
  resources :orders, only: [:update]
  resources :order_items, only: [:create, :update, :destroy]
  resources :favourite_voyages, only: [:create, :destroy]
  resources :favourite_ships, only: [:create, :destroy]

  get "checkout/cabins/:cabin_grouping_id" => "checkout#cabins", as: :checkout_cabins
  get "checkout/extras" => "checkout#extras", as: :checkout_extras
  get "checkout/cart" => "checkout#cart"
  get "checkout/confirm" => "checkout#confirm"
  post "checkout/signup" => "checkout#signup"
  post "checkout/apply_coupon" => "checkout#apply_coupon", as: :apply_coupon
  delete "checkout/remove_order_item/:id" => "checkout#remove_order_item", as: :remove_order_item

  get "dashboard/home" => "dashboard#home"
  get "dashboard/personal_details" => "dashboard#personal_details"
  get "dashboard/order_history" => "dashboard#order_history"
  get "dashboard/confirmed_itinerary" => "dashboard#confirmed_itinerary"
  get "dashboard/wishlist" => "dashboard#wishlist"
  get "dashboard/payments" => "dashboard#payments"
  post "download/payment_invoice/:id" => "dashboard#download_payment_invoice", as: :download_payment_invoice
  post "download/deposit_invoice/:id" => "dashboard#download_deposit_invoice", as: :download_deposit_invoice
  put "dashboard/update_details" => "dashboard#update_details"
  get "print/itinerary/:order_id" => "print#itinerary", as: :print_itinerary
  post "dashboard/send_itinerary_to_email" => "dashboard#send_itinerary_to_email", as: :send_itinerary_to_email
  root "pages#home"
end
