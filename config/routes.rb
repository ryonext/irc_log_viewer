Rails.application.routes.draw do
  resources :users
  resources :channels do
    resources :messages, shallow: true
  end
  resources :irc_logs, only: [:new, :create]

  root "channels#index"
end
