require 'rails_helper'

RSpec.describe RestaurantForm, type: :model do
  let(:restaurant) { create(:restaurant) }
  let(:valid_images) { [fixture_file_upload('images/test_image.jpeg', 'image/jpeg')] * 2 } # 2枚の画像を想定
  let(:invalid_images) { [] } # 無効な画像リスト（空）

  describe '初期化' do
    let(:form) { RestaurantForm.new(restaurant_id: restaurant.id, restaurant_images: valid_images) }

    it '正しいパラメータで初期化される' do
      expect(form.photos.length).to eq 2
    end
  end

  describe 'バリデーション' do
    context '添付枚数が1枚以上4枚以下の場合' do
      let(:form) { RestaurantForm.new(restaurant_images: valid_images) }

      it '有効である' do
        form.valid?
        expect(form.errors[:photos]).to be_empty
      end
    end

    context '添付枚数が規定外の場合' do
      let(:form) { RestaurantForm.new(restaurant_images: invalid_images) }

      it '無効である' do
        form.valid?
        expect(form.errors[:photos]).to include('添付枚数を確認してください。')
      end
    end
  end

  describe '#save!' do
    context '有効なパラメータが与えられた場合' do
      it 'RestaurantImageが保存される' do
        form = RestaurantForm.new(restaurant_id: restaurant.id, restaurant_images: valid_images)
        expect { form.save! }.to change(RestaurantImage, :count).by(valid_images.size)
      end
    end
  end
end
