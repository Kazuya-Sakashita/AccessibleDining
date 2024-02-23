class RestaurantForm
  include ActiveModel::Model

  attr_accessor :photos

  validate :validates_number_of_files

  def validates_number_of_files
    return unless 1 > photos.length || photos.length > 4

    errors.add(:photos, '添付枚数を確認してください。')
  end

  def initialize(restaurant_id: nil, restaurant_images: [])
    @photos = []
    restaurant_images.reject(&:blank?)&.each do |image|
      @photos << RestaurantImage.new(image_url: image, restaurant_id:)
    end
  end

  def save!
    raise ActiveRecord::RecordInvalid, self if invalid?

    @photos.each(&:save!)
  end
end
