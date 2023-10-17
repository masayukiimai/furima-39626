# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

     

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
it '重複したemailは登録できない' do
  @user.save
  another_user = FactoryBot.build(:user, email: @user.email)
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end

it 'emailに@がないと登録できない' do
  @user.email = 'testemail.com'
  @user.valid?
  expect(@user.errors.full_messages).to include("Email is invalid")
end



      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end
            
      it 'passwordが数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end
      
      it 'passwordに全角文字が含まれていると登録できない' do
        @user.password = '12345６'
        @user.password_confirmation = '12345６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end
      
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが半角文字を含むと登録できない' do
        @user.last_name = '田中t'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角文字で入力してください")
      end
      
      it 'first_nameが半角文字を含むと登録できない' do
        @user.first_name = '太郎t'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字で入力してください")
      end
      
      it 'last_name_kanaにカタカナ以外の文字が含まれると登録できない' do
        @user.last_name_kana = 'タナカた'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力してください")
      end
            
      it 'first_name_kanaにカタカナ以外の文字が含まれると登録できない' do
        @user.first_name_kana = 'タロウた'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力してください")
      end
      
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

    