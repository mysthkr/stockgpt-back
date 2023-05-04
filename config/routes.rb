Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
