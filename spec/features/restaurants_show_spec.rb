require 'rails_helper'

RSpec.feature 'ホーム画面', type: :feature do
  include ActionView::RecordIdentifier

  describe 'レストラン編集画面表示' do
    let!(:restaurant) { create(:restaurant) } # 事前にレストランを1つ作成

    context 'パラメーターに正しく設定されている場合' do
      before do
        visit restaurant_path(restaurant.id)
      end

      scenario '地図が表示されていることを確認' do
        map_id = dom_id(restaurant, 'map')
        expect(page).to have_css("##{map_id}") # `dom_id` ヘルパーメソッドを使用してIDを生成
      end
    end
  end
end
