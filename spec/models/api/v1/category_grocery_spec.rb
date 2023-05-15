require 'rails_helper'

RSpec.describe CategoryGrocery, type: :model do
  describe 'Validation' do
        context 'name is greater than 50' do
      it 'failure to register CategoryGrocery' do
        catGro = CategoryGrocery.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(catGro).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register CategoryGrocery' do
        catGro = CategoryGrocery.create(name: 'test catGro')
        expect(catGro).to be_valid
      end
    end
  end
end