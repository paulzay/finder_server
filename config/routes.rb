# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :cars
  end
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end
