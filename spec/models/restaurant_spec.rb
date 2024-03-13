require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context '各パラメータに正しく値が設定された場合' do
    before do
      Geocoder.configure(lookup: :test)
      Geocoder::Lookup::Test.set_default_stub([{ coordinates: [35.6895, 139.6917] }])
    end

    it '有効であること' do
      restaurant = Restaurant.new(
        name: 'テスト店舗',
        nearest_station: 'テスト駅',
        budget: 1000,
        category: 'テストカテゴリー',
        postal_code: '123-4567',
        address: 'テスト住所',
        city: 'テスト市',
        district: 'テスト区',
        phone_number: '123-456-7890',
        business_hours: '10:00 - 22:00',
        description: 'テスト説明'
      )
      expect(restaurant).to be_valid
    end

    it '住所がある場合、緯度と経度が自動計算されること' do
      restaurant = Restaurant.new(
        name: 'テスト店舗',
        nearest_station: 'テスト駅',
        budget: 1000,
        category: 'テストカテゴリー',
        postal_code: '123-4567',
        address: 'テスト住所',
        city: 'テスト市',
        district: 'テスト区',
        phone_number: '123-456-7890',
        business_hours: '10:00 - 22:00',
        description: 'テスト説明'
      )
      restaurant.valid?
      expect(restaurant.latitude).not_to be_nil
      expect(restaurant.longitude).not_to be_nil
    end
  end

  context '各パラメータに正しく値が設定さなかった場合' do
    before do
      Geocoder.configure(lookup: :test)
      Geocoder::Lookup::Test.add_stub(
        'フェイルテスト住所', # この住所に対するスタブを設定
        [{ 'latitude' => nil, 'longitude' => nil }] # ハッシュの配列で緯度と経度を返す
      )
    end

    it '住所がない場合、緯度と経度が計算されないこと' do
      restaurant = Restaurant.new(
        name: 'テスト店舗',
        nearest_station: 'テスト駅',
        budget: 1000,
        category: 'テストカテゴリー',
        postal_code: '123-4567',
        address: '',
        city: 'テスト市',
        district: 'テスト区',
        phone_number: '123-456-7890',
        business_hours: '10:00 - 22:00',
        description: 'テスト説明'
      )
      restaurant.valid?
      expect(restaurant.latitude).to be_nil
      expect(restaurant.longitude).to be_nil
    end

    it '住所があるが緯度と経度が存在しない場合、エラーが追加されること' do
      restaurant = Restaurant.new(
        name: 'テスト店舗',
        nearest_station: 'テスト駅',
        budget: 1000,
        category: 'テストカテゴリー',
        postal_code: '123-4567',
        address: 'フェイルテスト住所',
        city: 'テスト市',
        district: 'テスト区',
        phone_number: '123-456-7890',
        business_hours: '10:00 - 22:00',
        description: 'テスト説明'
      )

      restaurant.valid?
      expect(restaurant.errors[:base]).to include('緯度と経度は自動的に計算される必要があります。')
    end
  end
end
