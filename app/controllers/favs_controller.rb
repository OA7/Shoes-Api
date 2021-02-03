class FavsController < ApplicationController
  def index
    @user_shoes = logged_in_user.favourite_shoes
    render json: {
      user_shoes: @user_shoes
    }
  end

  def create
    fav_shoe = Fav.find_by(user_id: logged_in_user.id, shoe_id: params[:shoe_id])
    if fav_shoe
      render json: { error: 'Shoe already in favorites' }, status: :unprocessable_entity
    else
      Fav.create!(user_id: logged_in_user.id, shoe_id: params[:shoe_id])
      render json: { message: 'Favourite Created succesfully' }, status: :created
    end
  end
end
