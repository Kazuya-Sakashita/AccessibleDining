require 'rails_helper'

RSpec.feature 'ホーム画面', type: :feature do
  describe 'レストラン編集画面表示' do
    let!(:restaurant) { create(:restaurant) } # 事前にレストランを1つ作成

    context 'パラメーターに正しく設定されている場合' do
      before do
        visit edit_restaurant_path(restaurant.id)
      end

      scenario '編集フォームに値が表示されていること' do
        expect(page).to have_field('restaurant[name]', with: restaurant.name)
        expect(page).to have_field('restaurant[nearest_station]', with: restaurant.nearest_station)
        expect(page).to have_field('restaurant[budget]', with: restaurant.budget)
        expect(page).to have_field('restaurant[category]', with: restaurant.category)
        expect(page).to have_field('restaurant[postal_code]', with: restaurant.postal_code)
        expect(page).to have_field('restaurant[address]', with: restaurant.address)
        expect(page).to have_field('restaurant[city]', with: restaurant.city)
        expect(page).to have_field('restaurant[district]', with: restaurant.district)
        expect(page).to have_field('restaurant[latitude]', with: restaurant.latitude)
        expect(page).to have_field('restaurant[longitude]', with: restaurant.longitude)
        expect(page).to have_field('restaurant[phone_number]', with: restaurant.phone_number)
        expect(page).to have_field('restaurant[business_hours]', with: restaurant.business_hours)
        expect(page).to have_field('restaurant[description]', with: restaurant.description)
      end

      scenario 'レストラン情報が更新されていること' do
        fill_in 'restaurant[name]', with: '更新されたレストラン名'
        fill_in 'restaurant[nearest_station]', with: '更新された駅名'
        fill_in 'restaurant[budget]', with: 6000
        fill_in 'restaurant[category]', with: '更新されたカテゴリ'
        fill_in 'restaurant[description]', with: '更新された説明文'

        attach_file 'restaurant_for[restaurant_images][photos][]', Rails.root.join('spec/fixtures/files/images/new_image.jpeg') # 画像パスは適宜調整してください

        click_button '更新する'

        expect(page).to have_content '更新されたレストラン名'
        expect(page).to have_content '更新された駅名'
        expect(page).to have_content '6000'
        expect(page).to have_content '更新されたカテゴリ'
        expect(page).to have_content '更新された説明文'

        # 新しい画像が表示されていることを確認（画像の検証は実際のsrc属性や画像のパスに応じて調整が必要です）
        expect(page).to have_selector("img[src*='new_image.jpeg']")
      end
    end

    context 'パラメーターに正しく設定されなかった場合' do
      before do
        visit edit_restaurant_path(restaurant.id)
      end

      scenario '必須フィールドが空白の場合にエラーメッセージが表示されること' do
        fill_in 'restaurant[name]', with: ''
        fill_in 'restaurant[nearest_station]', with: ''
        fill_in 'restaurant[budget]', with: ''
        fill_in 'restaurant[category]', with: ''
        fill_in 'restaurant[description]', with: ''

        click_button '更新する'

        # エラーメッセージが表示されることを検証
        expect(page).to have_content('店名を入力してください')
        expect(page).to have_content('最寄り駅を入力してください')
        expect(page).to have_content('予算を入力してください')
        expect(page).to have_content('カテゴリを入力してください')
        expect(page).to have_content('説明を入力してください')

        # 変更がデータベースに反映されていないことを検証
        restaurant.reload
        expect(restaurant.name).not_to eq ''
        expect(restaurant.nearest_station).not_to eq ''
        expect(restaurant.budget).not_to eq ''
        expect(restaurant.category).not_to eq ''
        expect(restaurant.description).not_to eq ''
      end
    end
  end
end
