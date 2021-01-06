Rails.application.routes.draw do
  root 'shoes#index'
  get 'shoes', to: 'shoes#index'
  get 'shoes/:id', to: 'shoes#show'
  post "/users", to: "users#create"
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
end