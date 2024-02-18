require 'rails_helper'

RSpec.feature 'ホーム画面', type: :feature do
  describe 'レストラン一覧表示' do
    let!(:restaurant) { create(:restaurant) }

    scenario '未ログイン状態で表示されていること' do
      visit root_path
      # beforeで登録したものが表示されていることを確認する
      expect(page).to have_content(restaurant.name)
    end

    scenario 'ログイン状態で表示されていること' do
      # sign_in user
      visit root_path
      # beforeで登録したものが表示されていることを確認する
      expect(page).to have_content(restaurant.name)
    end
  end
end
