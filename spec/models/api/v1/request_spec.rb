require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'Validation' do
    context 'request_type is empty' do
      it 'failure to register request' do
        request = Request.create(request_name: "test")
        expect(request).not_to be_valid
      end
    end

    context 'request_type is greater than 50' do
      it 'failure to register request' do
        request = Request.create(request_type: 11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111)
        expect(request).not_to be_valid
      end
    end

    context 'request_name is empty' do
      it 'failure to register request' do
        request = Request.create(request_type: 1)
        expect(request).not_to be_valid
      end
    end

    context 'request_name is greater than 50' do
      it 'failure to register request_name' do
        request = Request.create(request_name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(request).not_to be_valid
      end
    end

    context 'enter all info for request' do
      it 'success to register request' do
        group = Group.create(name: 'test')
        user = User.create(email: 'test@gmail.com', password: 'password', group_id: group.id)
        request = Request.create(request_name: "test", request_type: 1, user_id: user.id)
        expect(request).to be_valid
      end
    end
  end
end