Rails.application.routes.draw do
  get 'payment/new'

  root "home#index"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :searches
  resources :users, controller: "users", only: [:create, :index, :show, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings do
      resources :bookings, only: [:destroy, :create, :new] do 
        resources :payment
      end
    end
  end

  
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/users/:user_id/listings/:id/update" => "listings#update_listing"
  get "/search" => "home#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
