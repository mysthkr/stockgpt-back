require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    context 'emai is empty' do
      it 'failure to register user' do
        user = User.create(email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'emai is greater than 100' do
      it 'failure to register user' do
        user = User.create(email: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@test.com',
                            password: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'password is empty' do
      it 'failure to register user' do
        user = User.create(email: 'test@gmail.com', password: '')
        expect(user).not_to be_valid
      end
    end

    context 'emai is less than 4' do
      it 'failure to register user' do
        user = User.create(email: 'test@gmail.com', password: 'pass')
        expect(user).not_to be_valid
      end
    end

    context 'enter email and password' do
      it 'success to register user' do
        Group.create(name: 'test')
        user = User.create(email: 'test@gmail.com', password: 'password', group_id: 1)
        expect(user).to be_valid
      end
    end
  end
end