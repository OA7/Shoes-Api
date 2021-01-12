class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login, :auto_login]
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token, fav_shoe: user.favourite_shoes, success: "Welcome back, #{user.username}"}
    else
        render json: {failure: "Log in failed! Username or password invalid!"}
    end
  end

  def auto_login
    if logged_in_user
      render json: {
        user: logged_in_user,
        logged_in: true
      }
    else
      render json: {
        errors: "No User Logged In",
        logged_in: false
      }
    end
  end

  def user_is_authed
    render json: {message: "You are authorized"}
  end
end