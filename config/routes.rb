Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  post "/sign-up", to: "users#create"
  resources :users, except: [:create]
  resources :companies do
    resources :vehicles
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
