require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Validation' do
        context 'name is greater than 50' do
      it 'failure to register group' do
        group = Group.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(group).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register group' do
        group = Group.create(name: 'testgroup')
        expect(group).to be_valid
      end
    end
  end
end