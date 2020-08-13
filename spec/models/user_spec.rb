require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastnamme、firstname、lastnamekana、firstnamekana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.lastname = '阿部'
        expect(@user).to be_valid
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.firstname = '太郎'
        expect(@user).to be_valid
      end
      it 'lastnamekanaが全角（カタカナ）であれば登録できる' do
        @user.lastnamekana = 'アベ'
        expect(@user).to be_valid
      end
      it 'firstnamekanaが全角（カタカナ）であれば登録できる' do
        @user.firstnamekana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnamekanaが空では登録できない' do
        @user.lastnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana can't be blank")
      end
      it 'firstnamekanaが空では登録できない' do
        @user.firstnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
