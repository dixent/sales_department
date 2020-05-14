Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :home, only: :index
  root to: 'home#index'
  namespace :manager do
    resources :products, only: %i[new index edit update]
    namespace :products do
      resources :pens
      resources :pencils
    end
    resources :orders
    resource :search_order, only: %i[create]
  end

  namespace :client do
    resources :products, only: %i[new index edit update]
    namespace :products do
      resources :pens
      resources :pencils
    end
  end
end
