class ShoesController < ApplicationController
  skip_before_action :authorized, only: %i[index show]
  def index
    shoes = Shoe.all
    render json: shoes
  end

  def show
    shoe = Shoe.find(params[:id])
    render json: shoe
  end
end
