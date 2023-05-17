require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe 'Validation' do
    context 'maker_name is empty' do
      it 'failure to register maker' do
        maker = Maker.create
        expect(maker).not_to be_valid
      end
    end

    context 'maker name is greater than 50' do
      it 'failure to register maker' do
        maker = Maker.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(maker).not_to be_valid
      end
    end

    context 'enter all info for maker' do
      it 'success to register maker' do
        maker = Maker.create(name: 'test maker')
        expect(maker).to be_valid
      end
    end
  end
end