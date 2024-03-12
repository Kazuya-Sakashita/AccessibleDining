class Restaurant < ApplicationRecord
  geocoded_by :address # addressは緯度経度を計算するためのフィールド
  before_validation :geocode, if: ->(obj) { obj.address.present? and obj.address_changed? }

  has_many :restaurant_images, dependent: :destroy
  geocoded_by :address
  after_validation :geocode

  validates :name, :nearest_station, :budget, :category, :postal_code, :address, :city,
            :district, :phone_number, :business_hours, :description, presence: true

  validate :latitude_and_longitude_present

  private

  def latitude_and_longitude_present
    return unless (latitude.blank? || longitude.blank?) && address.present?

    errors.add(:base, '緯度と経度は自動的に計算される必要があります。')
  end
end
