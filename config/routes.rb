# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show index]
  resources :cars
  resources :favorites
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auto_login', to: 'sessions#auto_login'
  get '*other', to: 'home#index'
end
