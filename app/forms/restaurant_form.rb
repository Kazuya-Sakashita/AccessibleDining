class RestaurantForm
  include ActiveModel::Model

  attr_accessor :photos

  validate :validates_number_of_files

  def validates_number_of_files
    return unless 1 > photos.length || photos.length > 4

    errors.add(:photos, '添付枚数を確認してください。')
  end

  def initialize(restaurant_id: nil, restaurant_images: [])
    @restaurant_id = restaurant_id
    @photos = restaurant_images.reject(&:blank?)
  end

  def save!
    raise ActiveModel::ValidationError, self unless valid?

    @photos.each do |photo|
      restaurant_image = RestaurantImage.new(restaurant_id: @restaurant_id)
      # ここでActive Storageを使用して画像を添付する
      restaurant_image.image.attach(photo) if photo.is_a?(ActionDispatch::Http::UploadedFile)
      restaurant_image.save!
    end
  end
end
