require 'rails_helper'

RSpec.feature 'ページネーションの表示', type: :feature do
  describe '1件の場合' do
    let!(:restaurant) { create(:restaurant) }

    before do
      visit root_path
    end

    context '１ページ目' do
      scenario '1件のレストランが表示されていること' do
        expect(page).to have_content(restaurant.name)
      end

      scenario 'ページネーションコントロールが存在しないこと' do
        expect(page).not_to have_selector '.pagination'
      end
    end
  end

  describe '2件以上ある場合' do
    let!(:restaurant) { create(:restaurant) }
    let!(:another_restaurant) { create(:restaurant) }

    before do
      visit root_path
    end

    context '１ページ目' do
      scenario 'レストランが表示されていること' do
        expect(page).to have_content(restaurant.name)
      end

      scenario '他のレストランは表示されていないこと' do
        expect(page).not_to have_content another_restaurant.name
      end

      scenario 'ページネーションコントロールが存在すること' do
        expect(page).to have_selector '.pagination'
      end
    end

    context '2ページ目' do
      before do
        click_link '2'
      end

      scenario '2ページ目が表示されていること' do
        expect(page).to have_current_path(/page=2/)
      end

      scenario '他のレストランが表示されていること' do
        expect(page).to have_content another_restaurant.name
      end
    end
  end
end
