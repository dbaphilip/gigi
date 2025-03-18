Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :users do
    member do
     get :delete
    end
  end

  get "signup" => "users#new"
  
  root "users#index"
end
