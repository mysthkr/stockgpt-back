

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validation' do
    context 'name is empty' do
      it 'failure to register item' do
        item = Item.create(criteria: 100)
        expect(item).not_to be_valid
      end
    end

    context 'criteria is empty' do
      it 'failure to register item' do
        item = Item.create(name: "item name")
        expect(item).not_to be_valid
      end
    end

    context 'name is greater than 100' do
      it 'failure to register name' do
        item = Item.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', criteria: 100)
        expect(item).not_to be_valid
      end
    end

    context 'criteria is greater than 100000' do
      it 'failure to register item' do
        item = Item.create(name: 'item name', criteria: 111111)
        expect(item).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register item' do
        item = Item.create(name: 'item name', criteria: 100)
        expect(item).to be_valid
      end
    end
  end
end