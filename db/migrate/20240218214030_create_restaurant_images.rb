class CreateRestaurantImages < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_images do |t|
      t.string :image_url
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
