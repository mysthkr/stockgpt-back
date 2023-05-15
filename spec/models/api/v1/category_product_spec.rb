require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  describe 'Validation' do
        context 'name is greater than 50' do
      it 'failure to register group' do
        catPro = CategoryProduct.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(catPro).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register CategoryProduct' do
        catPro = CategoryProduct.create(name: 'test catPro')
        expect(catPro).to be_valid
      end
    end
  end
end