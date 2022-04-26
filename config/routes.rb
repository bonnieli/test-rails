# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    post '/register', to: 'authentication#create'
    post '/login', to: 'authentication#login'
    resources :posts, only: :create
  end
end
