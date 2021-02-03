class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    user = User.create(user_params)
    if user.valid?
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, logged_in: true }
    else
      render json: { errors: 'Please check credetials or change Username' }
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
