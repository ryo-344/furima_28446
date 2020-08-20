require 'rails_helper'

RSpec.describe ItemShipping, type: :model do
  before do
    @item_shipping = FactoryBot.build(:item_shipping)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報が保存できる場合' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば保存できること' do
        expect(@item_shipping).to be_valid
      end

      it '郵便番号にはハイフンが必要であり3文字と4文字に別れていれば保存できること' do
        @item_shipping.postcode = '123-4567'
        expect(@item_shipping).to be_valid
      end

      it '電話番号には11桁の数字であれば保存できること' do
        @item_shipping.telephonenumber = '09012345678'
        expect(@item_shipping).to be_valid
      end
    end

    context '商品購入情報が保存できない場合' do
      it '郵便番号が空だと保存できないこと' do
        @item_shipping.postcode = ''
        @item_shipping.valid?
      end

      it '郵便番号にハイフンがあり3文字と4文字に別れてないと保存できないこと' do
        @item_shipping.postcode = '1234-567'
        @item_shipping.valid?
      end

      it '都道府県がないと保存できないこと' do
        @item_shipping.shippingorigin_id = 1
        @item_shipping.valid?
      end

      it '市町村がないと保存できないこと' do
        @item_shipping.city = ''
        @item_shipping.valid?
      end

      it '番地がないと保存できないこと' do
        @item_shipping.number = ''
        @item_shipping.valid?
      end

      it '電話番号がないと保存できないこと' do
        @item_shipping.telephonenumber = ''
        @item_shipping.valid?
      end

      it '電話番号が11桁の数字でないと保存できないこと' do
        @item_shipping.telephonenumber = '090123456789'
        @item_shipping.valid?
      end
    end
  end
end
