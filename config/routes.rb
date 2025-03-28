Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    member do
     get :delete
    end
  end

  resource :session, only: [:new, :create, :destroy]

  resources :products do
    member do
      get :delete
    end
  end
  
  get "sign_up" => "users#new"
  get "sign_in" => "sessions#new"
  get "about" => "pages#about"
  post "search" => "products#search"
  
  root "products#index"
end
