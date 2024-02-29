require 'rails_helper'

RSpec.feature 'ホーム画面', type: :feature do
  describe 'レストラン一覧表示' do
    let!(:user) { create(:user) }
    let!(:restaurant) { create(:restaurant) }
    let!(:image1) { create(:restaurant_image, restaurant:) }
    let!(:image2) { create(:restaurant_image, restaurant:) }

    context '未ログイン状態で表示されていること' do
      before do
        visit root_path
      end
      scenario '一覧画面が表示されていること' do
        expect(page).to have_content(restaurant.name)
        expect(restaurant.restaurant_images.count).to eq 2
      end

      scenario '画像が1枚表示されていること' do
        expect(page).to have_selector('img')
        expect(page).not_to have_selector('img', count: 2)
      end
    end

    context 'ログイン状態で表示されていること' do
      before do
        sign_in user
        visit root_path
      end
      scenario '一覧画面が表示されていること' do
        expect(page).to have_content(restaurant.name)
        expect(restaurant.restaurant_images.count).to eq 2
      end

      scenario '画像が1枚表示されていること' do
        expect(page).to have_selector('img')
        expect(page).not_to have_selector('img', count: 2)
      end
    end
  end
end
