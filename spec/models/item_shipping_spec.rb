require 'rails_helper'

RSpec.describe ItemShipping, type: :model do
  before do
    @buyer = FactoryBot.build(:item_shipping)
    @seller = FactoryBot.build(:item_shipping)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報が保存できる場合' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば保存できること' do
        expect(@buyer).to be_valid
      end

      it '郵便番号にはハイフンが必要であり3文字と4文字に別れていれば保存できること' do
        @buyer.postcode = '123-4567'
        expect(@buyer).to be_valid
      end

      it '電話番号には11桁の数字であれば保存できること' do
        @buyer.telephonenumber = '09012345678'
        expect(@buyer).to be_valid
      end
    end

    context '商品購入情報が保存できない場合' do
      it '郵便番号が空だと保存できないこと' do
        @buyer.postcode = ''
        @buyer.valid?
      end

      it '郵便番号にハイフンがあり3文字と4文字に別れてないと保存できないこと' do
        @buyer.postcode = '1234-567'
        @buyer.valid?
      end

      it '都道府県がないと保存できないこと' do
        @buyer.shippingorigin_id = 1
        @buyer.valid?
      end

      it '市町村がないと保存できないこと' do
        @buyer.city = ''
        @buyer.valid?
      end

      it '番地がないと保存できないこと' do
        @buyer.number = ''
        @buyer.valid?
      end

      it '電話番号がないと保存できないこと' do
        @buyer.telephonenumber = ''
        @buyer.valid?
      end

      it '電話番号が11桁の数字でないと保存できないこと' do
        @buyer.telephonenumber = '090123456789'
        @buyer.valid?
      end

      it '電話番号にハイフンがある場合保存できないこと' do
        @buyer.telephonenumber = '090-1234-5678'
        @buyer.valid?
      end
    end
  end
end
