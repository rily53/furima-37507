require 'rails_helper'
RSpec.describe BuyerShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@buyer_shipping_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @buyer_shipping_address.building_name = ''
        expect(@buyer_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空だと購入できない' do
        @buyer_shipping_address.token = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @buyer_shipping_address.post_code = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-が含まれていないと購入できない' do
        @buyer_shipping_address.post_code = '1231234'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeの文字数が正しく入力（123-1234）されていないと購入できない' do
        @buyer_shipping_address.post_code = '123-123'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが全角だと購入できない' do
        @buyer_shipping_address.post_code = '１２３−１２３４'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'areaが--だと購入できない' do
        @buyer_shipping_address.area_id = '1'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @buyer_shipping_address.municipalities = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと購入できない' do
        @buyer_shipping_address.address = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @buyer_shipping_address.phone = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが11文字未満だと購入できない' do
        @buyer_shipping_address.phone = '0901234567'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneが9桁以下だと購入できない' do
        @buyer_shipping_address.phone = '12345678'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneが12桁以上だと購入できない' do
        @buyer_shipping_address.phone = '090123456789'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneが全角だと購入できない' do
        @buyer_shipping_address.phone = '０９０１２３４５６７８'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'userが紐付いていなければ購入できない' do
        @buyer_shipping_address.user_id = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buyer_shipping_address.item_id = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
