require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  render_views

  context 'restaurants/new' do
    context '正常系' do
      # パラメーターを設定する
      let!(:restaurant_images) do
        [
          fixture_file_upload('images/836252516.jpeg', 'image/jpeg'),
          fixture_file_upload('images/884501802.jpeg', 'image/jpeg'),
          fixture_file_upload('images/1213865817.jpeg', 'image/jpeg'),
          fixture_file_upload('images/1406629107.jpeg', 'image/jpeg')
        ]
      end

      let(:restaurant_params) do
        {
          restaurant_for: {
            restaurant_images: {
              photos: restaurant_images
            }
          },
          restaurant: {
            name: 'テスト店舗1999',
            nearest_station: '駅J',
            budget: '3000',
            category: '居酒屋',
            postal_code: '111-1414',
            address: '東京都千代田区G地区13-13-13',
            city: '東京都',
            district: '千代田区',
            latitude: '123',
            longitude: '123',
            phone_number: '03-1234-4444',
            business_hours: '12:00 - 23:00',
            description: '居心地良い空間の居酒屋です。'
          }
        }
      end

      it '登録時、各パラメータに正しく値が設定された場合、SHOW画面が描画されること' do
        post :create, params: restaurant_params
        expect(response).to redirect_to restaurant_path(Restaurant.last.id)
      end

      it '新しいレストランが作成されること' do
        expect do
          post :create, params: restaurant_params
        end.to change(Restaurant, :count).by(1)
      end
    end
  end
end
