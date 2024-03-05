class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.includes(:restaurant_images).page(params[:page]).per(Settings.pagination.per.default)
  end

  def show; end

  def new
    @restaurant = Restaurant.new
    @restaurant_images = RestaurantForm.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    ActiveRecord::Base.transaction do
      @restaurant.save!

      restaurant_id = Restaurant.last.id
      if params[:restaurant_for][:restaurant_images][:photos].present?
        restaurant_images_params = params[:restaurant_for][:restaurant_images][:photos].reject(&:blank?)
      end

      if restaurant_images_params.present?
        @restaurant_images = RestaurantForm.new(restaurant_id: @restaurant.id,
                                                restaurant_images: restaurant_images_params)
        @restaurant_images.save!
      end
    end

    flash[:notice] = '登録完了しました。'
    redirect_to restaurant_path(@restaurant)
  rescue ActiveRecord::RecordInvalid => e
    # エラーメッセージを適切に表示します。
    flash[:alert] = e.record.errors.full_messages
    render :new, status: :unprocessable_entity
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path, notice: 'レストランが削除されました。'
  end

  def edit
    @restaurant_images = RestaurantForm.new if @restaurant.restaurant_images.blank?
  end

  def update
    ActiveRecord::Base.transaction do
      @restaurant.update!(restaurant_params)

      # 安全にparamsからrestaurant_images_paramsを取得
      restaurant_images_params = params.dig(:restaurant_for, :restaurant_images, :photos)&.reject(&:blank?)

      if restaurant_images_params.present?
        @restaurant.restaurant_images.destroy_all
        @restaurant_images = RestaurantForm.new(restaurant_id: @restaurant.id,
                                                restaurant_images: restaurant_images_params)
        @restaurant_images.save!
      end
    end

    flash[:notice] = '更新が完了しました。'
    redirect_to restaurant_path(@restaurant)
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = e.record.errors.full_messages
    render :edit, status: :unprocessable_entity
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :nearest_station, :budget, :category, :postal_code, :address, :city,
                                       :district, :latitude, :longitude, :phone_number, :business_hours, :description,
                                       restaurant_images: [photos: []])
  end

  def restaurant_images
    params.dig(:restaurant_form, :photos) || []
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
