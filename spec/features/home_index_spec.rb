require 'rails_helper'

RSpec.feature 'ホーム画面', type: :feature do
  describe 'レストラン一覧表示' do
    let!(:restaurant) { create(:restaurant) }
    let!(:image1) { create(:restaurant_image, restaurant:) }

    scenario '未ログイン状態で表示されていること' do
      visit root_path
      expect(page).to have_content(restaurant.name)
      expect(page).to have_selector('img')
    end

    # scenario 'ログイン状態で表示されていること' do
    #   # sign_in user を実装する
    #   visit root_path
    #   expect(page).to have_content(restaurant.name)
    #   # 画像が少なくとも一つ表示されていることを確認
    #   expect(page).to have_selector('img')
    # end
  end
end
