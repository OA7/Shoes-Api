class ShoesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
    shoes = Shoe.all
    render json: shoes
  end

  def show
    shoe = Shoe.find(params[:id])
    render json: shoe
  end
end