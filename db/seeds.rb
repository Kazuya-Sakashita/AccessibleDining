# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

restaurants = [
  { name: "レストランA", nearest_station: "駅A", budget: 3000, category: "和食", postal_code: "100-0001", address: "東京都千代田区A地区1-1-1", city: "東京都", district: "千代田区", latitude: 35.6851, longitude: 139.7514, phone_number: "03-1234-5678", business_hours: "10:00 - 20:00", description: "美味しい和食が楽しめるお店です。" },
  { name: "レストランB", nearest_station: "駅B", budget: 2000, category: "洋食", postal_code: "100-0002", address: "東京都千代田区B地区2-2-2", city: "東京都", district: "千代田区", latitude: 35.6852, longitude: 139.7522, phone_number: "03-1234-5679", business_hours: "11:00 - 21:00", description: "本格洋食をリーズナブルに提供しています。" },
  { name: "レストランC", nearest_station: "駅C", budget: 2500, category: "中華", postal_code: "100-0003", address: "東京都千代田区C地区3-3-3", city: "東京都", district: "千代田区", latitude: 35.6853, longitude: 139.7523, phone_number: "03-1234-5680", business_hours: "10:00 - 22:00", description: "伝統的な中華料理を楽しめるお店です。" },
  { name: "レストランD", nearest_station: "駅D", budget: 1500, category: "カフェ", postal_code: "100-0004", address: "東京都千代田区D地区4-4-4", city: "東京都", district: "千代田区", latitude: 35.6854, longitude: 139.7524, phone_number: "03-1234-5681", business_hours: "9:00 - 18:00", description: "くつろぎの時間を提供するカフェです。" },
  { name: "レストランE", nearest_station: "駅E", budget: 3500, category: "イタリアン", postal_code: "100-0005", address: "東京都千代田区E地区5-5-5", city: "東京都", district: "千代田区", latitude: 35.6855, longitude: 139.7525, phone_number: "03-1234-5682", business_hours: "12:00 - 23:00", description: "本格イタリアンをカジュアルに楽しめます。" },
  { name: "レストランF", nearest_station: "駅F", budget: 4000, category: "フレンチ", postal_code: "100-0006", address: "東京都千代田区F地区6-6-6", city: "東京都", district: "千代田区", latitude: 35.6856, longitude: 139.7526, phone_number: "03-1234-5683", business_hours: "12:00 - 24:00", description: "フランス料理の真髄を味わえるレストランです。" },
  { name: "レストランG", nearest_station: "駅G", budget: 1000, category: "ラーメン", postal_code: "100-0007", address: "東京都千代田区G地区7-7-7", city: "東京都", district: "千代田区", latitude: 35.6857, longitude: 139.7527, phone_number: "03-1234-5684", business_hours: "11:00 - 15:00, 17:00 - 21:00", description: "こだわりのスープが自慢のラーメン店です。" },
  { name: "レストランH", nearest_station: "駅H", budget: 5000, category: "鉄板焼き", postal_code: "100-0008", address: "東京都千代田区H地区8-8-8", city: "東京都", district: "千代田区", latitude: 35.6858, longitude: 139.7528, phone_number: "03-1234-5685", business_hours: "17:00 - 23:00", description: "最高級の食材を使用した鉄板焼きが楽しめます。" },
  { name: "レストランI", nearest_station: "駅I", budget: 4500, category: "寿司", postal_code: "100-0009", address: "東京都千代田区I地区9-9-9", city: "東京都", district: "千代田区", latitude: 35.6859, longitude: 139.7529, phone_number: "03-1234-5686", business_hours: "12:00 - 22:00", description: "新鮮な魚介を使った寿司を提供します。" },
  { name: "レストランJ", nearest_station: "駅J", budget: 5500, category: "懐石料理", postal_code: "100-0010", address: "東京都千代田区J地区10-10-10", city: "東京都", district: "千代田区", latitude: 35.6860, longitude: 139.7530, phone_number: "03-1234-5687", business_hours: "17:00 - 23:00", description: "季節の食材を活かした日本の伝統料理を堪能できます。" }
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end
