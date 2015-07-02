Rails.application.routes.draw do
  resources :employees
  resources :employers
  resources :qr_codes
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logs' => 'logs#index'
end
