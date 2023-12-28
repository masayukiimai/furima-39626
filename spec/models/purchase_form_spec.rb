require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_form).to be_valid
      end

      it '建物名が空でも保存できること' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '購入情報が保存できない場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号がハイフンなしでは保存できないこと' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が選択されていないと保存できないこと' do
        @purchase_form.region_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Region must be other than 0")
      end

      it '市区町村が空だと保存できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できないこと' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上だと保存できないこと' do
        @purchase_form.phone_number = '123456789012'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @purchase_form.phone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'トークンが空だと保存できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end

    it 'userが紐付いていなければ購入できないこと' do
      @purchase_form.user_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できないこと' do
      @purchase_form.item_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
