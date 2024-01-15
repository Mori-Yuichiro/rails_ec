# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'admins#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  root 'items#index'
  resources :items, only: %i[show]
  resources :admins, path: '/admin/items', only: %i[index new create edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
