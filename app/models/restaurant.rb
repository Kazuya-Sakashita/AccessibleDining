class Restaurant < ApplicationRecord
  has_many :restaurant_images, dependent: :destroy
  geocoded_by :address
  after_validation :geocode

  validates :name, :nearest_station, :budget, :category, :postal_code, :address, :city,
            :district, :phone_number, :business_hours, :description, presence: true
end
