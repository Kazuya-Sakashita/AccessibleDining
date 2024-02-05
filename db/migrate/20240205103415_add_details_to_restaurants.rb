class AddDetailsToRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, comment: '店名'
      t.string :nearest_station, comment: '最寄り駅'
      t.integer :budget, comment: '予算'
      t.string :category, comment: 'カテゴリ'
      t.string :postal_code, null: false, comment: '郵便番号'
      t.string :address, null: false, comment: '住所文字列'
      t.string :city, null: false, comment: '市町村'
      t.string :district, comment: '地区'
      t.float :latitude, null: false, comment: '緯度'
      t.float :longitude, null: false, comment: '経度'
      t.string :phone_number, null: false, comment: '電話番号'
      t.string :business_hours, comment: '営業時間'
      t.text :description, comment: '説明'

      t.timestamps
    end
  end
end
