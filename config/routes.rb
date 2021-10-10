Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tracklists, :artists, :tracks

  post '/login', to: 'sessions#login'

  resources :users, only: [:show] do
    resources :notifications, only: [:index]
  end

  resources :artists, only: [:show] do
    resources :tracks, only: [:index]
    resources :tracklists, only: [:index]
  end

  resources :tracks, only: [:show] do
    resources :tracklists, only: [:index]
  end

  post '/users/:id/notifications', to: 'notifications#read'
  
end
