class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(Settings.pagination.per.default)
  end

  def show; end

  def new; end

  def create; end

  def destroy; end

  def edit; end
end
