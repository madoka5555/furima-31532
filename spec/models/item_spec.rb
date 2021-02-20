require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品成功' do
      it 'image/name/detail/price/category_id/status_id/delivery_fee_id/prefecture_id/delivery_day_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品失敗' do
      it 'imageが存在しなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが存在しなければ保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが存在しなければ保存できない' do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'priceが存在しなければ保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300未満だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥9,999,999より大きいと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角数字だと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数混合だと保存できない' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけだと保存できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが存在しなければ保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'category_idが1だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが存在しなければ保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it 'status_idが1だと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_fee_idが存在しなければ保存できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
      end
      it 'delivery_fee_idが1だと保存できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'prefecture_idが存在しなければ保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'delivery_day_idが存在しなければ保存できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", 'Delivery day is not a number')
      end
      it '_idが1だと保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

