Rails.application.routes.draw do
  resources :employees
  resources :employers
  resources :qr_codes
  resources :properties
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'auth' => 'sessions#create'
  get 'logs/new' => 'logs#new'
  get 'logs' => 'logs#index'
  
  get 'listings' => 'properties#listings'
end
