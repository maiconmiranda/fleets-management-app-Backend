Rails.application.routes.draw do
  resources :incidents
  get "/incidents-company", to: "incidents#incidents_company_all" 


  resources :daily_reports
  get "/daily-reports-company", to: "daily_reports#daily_reports_company_all" 


  resources :daily_tracks
  get "/daily-tracks-company", to: "daily_tracks#daily_tracks_company_all" 
  
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  post "/sign-up", to: "users#create"
  get "/users-company", to: "users#user_company"
  resources :users, except: [:create]
  resources :companies
  
  resources :vehicles
  get "/vehicles-company", to: "vehicles#vehicles_company_all" 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
