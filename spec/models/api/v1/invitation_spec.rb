

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'Validation' do
    context 'group id is empty' do
      it 'failure to register invitation' do
        invitation = Invitation.create(user_id: 1)
        expect(invitation).not_to be_valid
      end
    end

    context 'user id is empty' do
      it 'failure to register invitation' do
        invitation = Invitation.create(group_id: 1)
        expect(invitation).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register invitation' do
        group = Group.create(name: 'test')
        user = User.create(email: 'test@gmail.com', password: 'password', group_id: group.id)
        invitation = Invitation.create(user_id: user.id, group_id: group.id)
        expect(invitation).to be_valid
      end
    end
  end
end