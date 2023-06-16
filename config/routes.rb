Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :invitations, except: [:index]
      resources :favorites
      resources :shops
      resources :criteria_days
      resources :makers
      resources :carts
      resources :to_buy_lists
      resources :requests
      resources :stock_items do
        get "alarms", on: :collection
      end
      resources :sub_category_groceries
      resources :sub_category_products
      resources :products
      resources :groceries
      resources :groups, except: [:index]
      resources :profiles
      resources :users
      resources :category_products
      resources :category_groceries
      post 'searches', to: 'searches#create'

      namespace :admin do
        resources :items
        resources :invitations
        resources :favorites
        resources :shops
        resources :criteria_days
        resources :makers
        resources :carts
        resources :to_buy_lists
        resources :requests
        resources :stock_items
        resources :sub_category_groceries
        resources :sub_category_products
        resources :products
        resources :groceries
        resources :groups
        resources :profiles
        resources :users
        resources :category_products
        resources :category_groceries
      end
    end
  end
  namespace :api do
    namespace :v1, { format: 'json' } do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: "api/v1/auth/registrations"
      }
    end
  end
end
