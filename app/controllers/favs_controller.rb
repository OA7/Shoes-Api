class FavsController < ApplicationController
  def fav_create
    fav_shoe = Fav.find_by(user_id: logged_in_user.id, shoe_id: params[:shoe_id])

    if fav_shoe
      fav_shoe.destroy
      render json: { status: 'Favs Destroyed succesfully' }
    else
      fav_shoe = Fav.create!(user_id: logged_in_user.id, shoe_id: params[:shoe_id])
      render json: { status: 'Favourite Created succesfully' }
    end
  end

  def fav_shoes
    @user_shoes = logged_in_user.favourite_shoes
    render json: {
      user_shoes: @user_shoes
    }
  end
end