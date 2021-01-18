Rails.application.routes.draw do
  root 'shoes#index'
  resources :favs, only: [:index, :create]
  get 'shoes', to: 'shoes#index'
  get 'shoes/:id', to: 'shoes#show'
  post "/users", to: "users#create"
  post "/login", to: "auth#login"
end