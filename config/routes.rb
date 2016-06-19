Rails.application.routes.draw do
  resources :users
  resources :channels
  resources :users
  resources :messages
  resources :channels

  root "channels#index"
end
