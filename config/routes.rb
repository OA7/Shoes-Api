Rails.application.routes.draw do
  root 'shoes#index'
  get 'shoes', to: 'shoes#index'
  get 'shoes/:id', to: 'shoes#show'
  post "/users", to: "users#create"
  post "/login", to: "auth#login"
  post 'favourites/new/:shoe_id', to: 'favs#fav_create'
  get 'favourites/all', to: 'favs#fav_shoes'
end