# spec/system/purchase_spec.rb
require 'rails_helper'

RSpec.describe "商品購入", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    # 売却済みの商品を作成する場合はここでcreateする
    # 例: @sold_item = ...
  end

  context '商品が購入できるとき' do
    it 'ログインしたユーザーは自身が出品していない販売中商品を購入できる' do
      # ログインする
      sign_in(@user)
      # 商品詳細ページに遷移する
      visit item_path(@item)
      # 「購入画面に進む」ボタンがあることを確認する
      expect(page).to have_content('購入画面に進む')
      # 購入ページに遷移する
      visit item_orders_path(@item)
      # フォームに情報を入力する
      fill_in 'card-number', with: '4242424242424242'
      fill_in 'card-exp-month', with: '12'
      fill_in 'card-exp-year', with: '24'
      fill_in 'card-cvc', with: '123'
      fill_in 'postal-code', with: '123-4567'
      select '東京都', from: 'prefecture'
      fill_in 'city', with: '渋谷区'
      fill_in 'addresses', with: '1-1'
      fill_in 'phone-number', with: '09012345678'
      # 購入ボタンをクリックする
      click_on('購入')
      # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
      # 「購入が完了しました」というメッセージが表示されていることを確認する
      expect(page).to have_content('購入が完了しました')
    end
  end

  context '商品が購入できないとき' do
    it 'ログインしていないと商品購入ページに遷移できない' do
      # 商品詳細ページに遷移する
      visit item_path(@item)
      # 「購入画面に進む」ボタンがないことを確認する
      expect(page).to have_no_content('購入画面に進む')
    end

    it 'ログインしていても自身が出品した商品の商品購入ページには遷移できない' do
      # 出品者でログインする
      sign_in(@item.user)
      # 商品詳細ページに遷移する
      visit item_path(@item)
      # 「購入画面に進む」ボタンがないことを確認する
      expect(page).to have_no_content('購入画面に進む')
    end

    it 'ログインしていても売却済み商品の商品購入ページには遷移できない' do
      # ここに売却済みの商品に対するテストを記述する
    end
  end
end
