Rails.application.routes.draw do
  devise_for :users
  get 'static/welcome'
  resources :tasks
  resources :buckets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  root "static#welcome"
end
