Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :items
    end
  end
  namespace :api do
    namespace :v1 do
      resources :invitations
    end
  end
  namespace :api do
    namespace :v1 do
      resources :favorites
    end
  end
  namespace :api do
    namespace :v1 do
      resources :shops
    end
  end
  namespace :api do
    namespace :v1 do
      resources :criteria_days
    end
  end
  namespace :api do
    namespace :v1 do
      resources :makers
    end
  end
  namespace :api do
    namespace :v1 do
      resources :carts
    end
  end
  namespace :api do
    namespace :v1 do
      resources :to_buy_lists
    end
  end
  namespace :api do
    namespace :v1 do
      resources :requests
    end
  end
  namespace :api do
    namespace :v1 do
      resources :stock_items
    end
  end
  namespace :api do
    namespace :v1 do
      resources :sub_category_groceries
    end
  end
  namespace :api do
    namespace :v1 do
      resources :sub_category_products
    end
  end
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  namespace :api do
    namespace :v1 do
      resources :groceries
    end
  end
  namespace :api do
    namespace :v1 do
      resources :groups
    end
  end
  namespace :api do
    namespace :v1 do
      resources :profiles
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  namespace :api do
    namespace :v1 do
      resources :category_products
    end
  end
  namespace :api do
    namespace :v1 do
      resources :category_groceries
    end
  end
  namespace :api do
    namespace :v1, { format: 'json' } do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: "api/v1/auth/registrations"
      }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
