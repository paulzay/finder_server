# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create show index]
  resources :cars
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end
