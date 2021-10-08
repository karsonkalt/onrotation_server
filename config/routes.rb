Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tracklists, :artists, :tracks

  post '/login', to: 'sessions#login'

  resources :users, only: [:show] do
    resources :notifications, only: [:index]
  end

  post '/users/:id/notifications', to: 'notifications#read'
  
end
