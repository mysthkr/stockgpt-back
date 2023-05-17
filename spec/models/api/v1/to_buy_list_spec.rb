require 'rails_helper'

RSpec.describe ToBuyList, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register to_buy_list' do
        to_buy_list = ToBuyList.create(item_id: 1)
        expect(to_buy_list).not_to be_valid
      end
    end

    context 'item id is empty' do
      it 'failure to register to_buy_list' do
        to_buy_list = ToBuyList.create(group_id: 1)
        expect(to_buy_list).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register to_buy_list' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        to_buy_list = ToBuyList.create(item_id: item.id, group_id: group.id, buy_flag: true)
        expect(to_buy_list).to be_valid
      end
    end
  end
end