class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(Settings.pagination.per.default)
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def destroy; end

  def edit; end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :nearest_station, :budget, :category, :postal_code, :address, :city,
                                       :district, :latitude, :longitude, :phone_number, :business_hours, :description)
  end
end
