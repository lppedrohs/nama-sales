Rails.application.routes.draw do
  root 'home#index'

  resources :sales
  resources :buyers
  resources :providers
end
