class Restaurant < ApplicationRecord
  has_many :restaurant_images, dependent: :destroy

  validates :name, :nearest_station, :budget, :category, :postal_code, :address, :city,
            :district, :latitude, :longitude, :phone_number, :business_hours, :description, presence: true
end
