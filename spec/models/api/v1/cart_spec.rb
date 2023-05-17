require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register cart' do
        cart = Cart.create(item_id: 1, criteria: 100)
        expect(cart).not_to be_valid
      end
    end

    context 'item id is empty' do
      it 'failure to register profile' do
        cart = Cart.create(group_id: 1, criteria: 100, price: 100)
        expect(cart).not_to be_valid
      end
    end

    context 'criteria is empty' do
      it 'failure to register profile' do
        cart = Cart.create(group_id: 1, item_id: 1)
        expect(cart).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register cart' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        cart = Cart.create(item_id: item.id, group_id: group.id, criteria: item.criteria, price: 1000)
        expect(cart).to be_valid
      end
    end
  end
end