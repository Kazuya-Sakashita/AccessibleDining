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

      it '新しいレストランが作成されていること' do
        expect do
          post :create, params: restaurant_params
        end.to change(Restaurant, :count).by(1)
      end

      it '各パラメータに正しく値が設定された場合、flash画面が正しく表示されていること' do
        post :create, params: restaurant_params
        expect(flash[:notice]).to eq '登録完了しました。'
      end
    end

    context '異常系' do # パラメーターを設定する
      let(:restaurant_params) do
        {
          restaurant_for: {
            restaurant_images: {
              photos: nil
            }
          },
          restaurant: {
            name: nil,
            nearest_station: nil,
            budget: nil,
            category: nil,
            postal_code: nil,
            city: nil,
            district: nil,
            latitude: nil,
            longitude: nil,
            phone_number: nil,
            business_hours: nil,
            description: nil
          }
        }
      end

      it '登録時、各パラメータに正しく値が設定されなかった場合、登録画面が描画されること' do
        post :create, params: restaurant_params
        expect(response).to render_template(:new)
      end

      it '新しいレストランが作成されないこと' do
        expect do
          post :create, params: restaurant_params
        end.to change(Restaurant, :count).by(0)
      end

      it '各パラメータに正しく値が設定されていなかあった場合、flash画面が正しく表示されていること' do
        post :create, params: restaurant_params
        expect(flash[:alert]).to eq [
          '店名を入力してください。',
          '最寄り駅を入力してください。',
          '予算を入力してください。',
          'カテゴリを入力してください。',
          '郵便番号を入力してください。',
          '住所を入力してください。',
          '市町村を入力してください。',
          '地区を入力してください。',
          '緯度を入力してください。',
          '経度を入力してください。',
          '電話番号を入力してください。',
          '営業時間を入力してください。',
          '説明を入力してください。'
        ]
      end
    end
  end
end
