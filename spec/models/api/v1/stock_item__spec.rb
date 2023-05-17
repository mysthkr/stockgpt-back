require 'rails_helper'

RSpec.describe StockItem, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register stock_item' do
        stock_item = StockItem.create(item_id: 1, criteria: 100, alarm_date: '2021-01-01', quantity: 1)
        expect(stock_item).not_to be_valid
      end
    end

    context 'item id is empty' do
      it 'failure to register stock_item' do
        stock_item = StockItem.create(group_id: 1, criteria: 100, alarm_date: '2021-01-01', quantity: 1)
        expect(stock_item).not_to be_valid
      end
    end

    context 'criteria is empty' do
      it 'failure to register stock_item' do
        stock_item = StockItem.create(group_id: 1, item_id: 1, alarm_date: '2021-01-01', quantity: 1)
        expect(stock_item).not_to be_valid
      end
    end

    context 'alarm_date is empty' do
      it 'failure to register stock_item' do
        stock_item = StockItem.create(group_id: 1, item_id: 1, criteria: 100, quantity: 1)
        expect(stock_item).not_to be_valid
      end
    end

    context 'alarm_date is quantity' do
      it 'failure to register stock_item' do
        stock_item = StockItem.create(group_id: 1, item_id: 1, criteria: 100, alarm_date: '2021-01-01')
        expect(stock_item).not_to be_valid
      end
    end

    context 'criteria is greater than 100000' do
      it 'failure to register stock_item' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        stock_item = StockItem.create(group_id: 1, item_id: 1, criteria: 111111, alarm_date: '2021-01-01', quantity: 1)
        expect(stock_item).not_to be_valid
      end
    end

    context 'price is greater than 100000000000' do
      it 'failure to register stock_item' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        stock_item = StockItem.create(group_id: 1, item_id: 1, criteria: 100, alarm_date: '2021-01-01', quantity: 1, price: 100000000000)
        expect(stock_item).not_to be_valid
      end
    end

    context 'quantity is greater than 100000' do
      it 'failure to register stock_item' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        stock_item = StockItem.create(group_id: 1, item_id: 1, criteria: 100, alarm_date: '2021-01-01', quantity: 111111)
        expect(stock_item).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register stock_item' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        stock_item = StockItem.create(group_id: group.id, item_id: item.id, criteria: item.criteria, alarm_date: '2021-01-01', quantity: 1)
        expect(stock_item).to be_valid
      end
    end
  end
end