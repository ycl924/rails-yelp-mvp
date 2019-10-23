class RestaurantsController < ApplicationController
  before_action :set_item, only: [ :show ]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  private

  def set_item
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
