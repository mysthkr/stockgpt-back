require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Validation' do
    context 'name is empty' do
      it 'failure to register profile' do
        profile = Profile.create(name: '')
        expect(profile).not_to be_valid
      end
    end

    context 'name is greater than 50' do
      it 'failure to register name' do
        profile = Profile.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(profile).not_to be_valid
      end
    end

    context 'roommate is greater than 100' do
      it 'failure to register profile' do
        profile = Profile.create(name: 'testname', roommate_number: 100)
        expect(profile).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register profile' do
        group = Group.create(name: 'test')
        user = User.create(email: 'test@gmail.com', password: 'password', group_id: group.id)
        profile = Profile.create(name: 'testname', roommate_number: 1, id: 1, user_id: user.id)
        expect(profile).to be_valid
      end
    end
  end
end