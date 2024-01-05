require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '必要な情報が全て存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end
      
      it 'priceが300未満だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999より大きいと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

  it 'category_idが空だと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'condition_idが空だと保存できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

  it 'shipping_fee_idが空だと保存できない' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
  end

  it 'prefecture_iddが空だと保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
  end

  it 'shipping_time_idが空だと保存できない' do
      @item.shipping_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping time can't be blank")
  end

  it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'カテゴリーが---では出品できない' do
    @item.category_id = 0 
    @item.valid?
    expect(@item.errors.full_messages).to include('Category must be selected')
  end

  it '商品の状態が---では出品できない' do
    @item.condition_id = 0 
    @item.valid?
    expect(@item.errors.full_messages).to include('Condition must be selected')
  end

  it '配送料の負担が---では出品できない' do
    @item.shipping_fee_id = 0 
    @item.valid?
    expect(@item.errors.full_messages).to include('Shipping fee must be selected')
  end

  it '発送元の地域が---では出品できない' do
    @item.prefecture_id = 0 
    @item.valid?
    expect(@item.errors.full_messages).to include('Region must be selected')
  end

  it '発送までの日数が---では出品できない' do
    @item.shipping_time_id = 0 
    @item.valid?
    expect(@item.errors.full_messages).to include('Shipping time must be selected')
  end

  it '価格に半角数字以外が含まれている場合は出品できない' do
    @item.price = '１０００'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not a number')
  end

  it 'userが紐付いていなければ出品できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
end   
end
end
