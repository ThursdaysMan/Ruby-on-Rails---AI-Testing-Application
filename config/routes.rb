Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  #root 'application#hello'

  #root 'entries#index'
  #resources :entries, only: [:create, :new, :destroy]

  root 'maps#index'
  resources :maps, only: [:index] 
  resources :alert_layers, only: [:create, :destroy, :update]

  #Other Routes
  get 'satellite_ingest_settings', to: 'maps#satelliteingestsettings', as: 'satellite_settings'
  patch 'update_settings', to: 'maps#update_settings', as: 'update_settings'
  get 'update_settings', to: 'maps#satelliteingestsettings'

  #Dynamic Map Routes
  get 'update_alert_map', to: 'maps#update_alert_map', as: 'update_alert_map'
  get 'show_base_map', to: 'maps#show_base_map', as: 'show_base_map'
  get 'show_alert_list', to: 'maps#show_alert_list', as: 'show_alert_list'
  get 'show_notification_list', to: 'maps#show_notification_list', as: 'show_notification_list'

end
