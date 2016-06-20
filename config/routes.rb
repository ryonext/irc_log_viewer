Rails.application.routes.draw do
  resources :users
  resources :channels
  resources :users
  resources :messages
  resources :channels

  resources :irc_logs, only: [:new, :create]

  root "channels#index"
end
