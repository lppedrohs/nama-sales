Rails.application.routes.draw do
  root 'importations#index'

  resources :sales
  resources :buyers
  resources :providers

  resources :importations, only: [:index, :create, :show]
end
