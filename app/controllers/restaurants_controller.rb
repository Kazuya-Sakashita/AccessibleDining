class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(6)
  end

  def show; end

  def new; end

  def create; end

  def destroy; end

  def edit; end
end
