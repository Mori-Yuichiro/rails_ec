# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  root 'items#index'

  resources :items, only: %i[show]
  resources :admins, path: '/admin/items', only: %i[index new create edit update destroy]
  resources :cart, only: %i[index destroy], controller: :carts
  post '/cart/:item_id', to: 'carts#create'
  resources :orders, only: %i[index show create]
end
