class Restaurant < ApplicationRecord
  has_many :restaurant_images, dependent: :destroy
end
