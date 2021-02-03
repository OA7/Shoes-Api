class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]
  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, fav_shoe: user.favourite_shoes, success: "Welcome back, #{user.username}" }
    else
      render json: { failure: 'Log in failed! Username or password invalid!' }
    end
  end
end
