# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: %i[show]
  resources :admins, path: '/admin/items', only: %i[index new create edit update destroy]
  resources :cart, only: %i[index destroy], controller: :carts
  post '/cart/:item_id', to: 'carts#create'
end
