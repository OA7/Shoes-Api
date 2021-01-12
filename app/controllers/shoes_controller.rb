class ShoesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  def index
    puts "User is #{logged_in_user.username}"
    shoes = Shoe.all
    render json: shoes
  end

  def show
    shoe = Shoe.find(params[:id])
    render json: shoe
  end
end