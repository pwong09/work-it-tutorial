require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'

Rails.application.routes.draw do
  get 'mailers/create'
  get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"

  resources :mailers, only: [:create]

  get "/sent", to: "mailers#sent"
end
