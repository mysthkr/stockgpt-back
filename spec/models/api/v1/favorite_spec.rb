require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register favorite' do
        favorite = Favorite.create(item_id: 1)
        expect(favorite).not_to be_valid
      end
    end

    context 'item id is empty' do
      it 'failure to register profile' do
        favorite = Favorite.create(group_id: 1)
        expect(favorite).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register favorite' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        favorite = Favorite.create(item_id: item.id, group_id: group.id)
        expect(favorite).to be_valid
      end
    end
  end
end