Rails.application.routes.draw do

  
  resources :incidents
  # Get all the incidents based on current_use and company Id
  get "/incidents-company", to: "incidents#incidents_company_all" 


  resources :daily_reports
  # Get all the daily reports based on current_use and company Id
  get "/daily-reports-company", to: "daily_reports#daily_reports_company_all" 


  resources :daily_tracks
 # Get all the daily tracks based on current_use and company Id
  get "/daily-tracks-company", to: "daily_tracks#daily_tracks_company_all" 
  
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  post "/sign-up", to: "users#create"
#Get all drivers that belongs to company
  get "/users-company", to: "users#user_company"
  resources :users, except: [:create]
  resources :companies
  
  resources :vehicles
   # Get all the vehicles based on current_use and company Id
  get "/vehicles-company", to: "vehicles#vehicles_company_all" 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
