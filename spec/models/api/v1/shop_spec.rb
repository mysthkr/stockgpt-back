require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'Validation' do
    context 'shop name is empty' do
      it 'failure to register shop' do
        shop = Shop.create(prefecture: 'Tokyo')
        expect(shop).not_to be_valid
      end
    end

    context 'shop name is greater than 50' do
      it 'failure to register shop' do
        shop = Shop.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(shop).not_to be_valid
      end
    end

    context 'shop prefecture is empty' do
      it 'failure to register shop' do
        shop = Shop.create(name: 'test shop')
        expect(shop).not_to be_valid
      end
    end

    context 'enter all info for shop' do
      it 'success to register shop' do
        shop = Shop.create(name: 'test shop', prefecture: 'Tokyo')
        expect(shop).to be_valid
      end
    end
  end
end