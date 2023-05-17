require 'rails_helper'

RSpec.describe CriteriaDay, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register criteria_day' do
        criteria_day = CriteriaDay.create(item_id: 1, criteria: 100)
        expect(criteria_day).not_to be_valid
      end
    end

    context 'item id is empty' do
      it 'failure to register profile' do
        criteria_day = CriteriaDay.create(group_id: 1, criteria: 100)
        expect(criteria_day).not_to be_valid
      end
    end

    context 'criteria is empty' do
      it 'failure to register profile' do
        criteria_day = CriteriaDay.create(group_id: 1, item_id: 1)
        expect(criteria_day).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register criteria_day' do
        group = Group.create(name: 'test')
        item = Item.create(name: 'testname', criteria: 100)
        criteria_day = CriteriaDay.create(item_id: item.id, group_id: group.id, criteria: item.criteria)
        expect(criteria_day).to be_valid
      end
    end
  end
end