Rails.application.routes.draw do
  namespace :admin do
    get "orders/index"
  end
  get "password_resets/new"
  get "password_resets/edit"

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"

    get "home", to: "static_pages#home", as: :home_client
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :carts, only: [:index] do
      collection do
        post "add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
      end
    end
    resources :users
    resources :static_pages, only: [:index, :show]
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
  end

  resources :products
end
