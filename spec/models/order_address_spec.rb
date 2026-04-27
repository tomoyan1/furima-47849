require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address, user_id: 1, item_id: 1)
    end

    context '内容が正しく入力されているとき' do
      it '全項目の内容が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空欄でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容が正しく入力されていないときは保存できない(郵便番号)' do
      it '郵便番号が空欄' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に-(ハイフン)が含まれていない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が7桁未満' do
        @order_address.postal_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が8桁以上' do
        @order_address.postal_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が全角数字' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
    end

    context '内容が正しく入力されていないときは保存できない(都道府県、市区町村、番地、電話番号)' do
      it '都道府県(prefecture_id)が[1]' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村(city)が空欄' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地(addresses)が空欄' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号(phone_number)が空欄' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号(phone_number)が全角数字' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号(phone_number)が10桁未満' do
        @order_address.phone_number = '090123456'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号(phone_number)が12桁以上' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end

    context '内容が正しく入力されていないときは保存できない(user_id,item_id)' do
      it 'user_idが空欄' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空欄' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空欄' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
