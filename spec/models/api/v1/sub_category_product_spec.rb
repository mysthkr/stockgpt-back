require 'rails_helper'

RSpec.describe SubCategoryProduct, type: :model do
  describe 'Validation' do
        context 'name is greater than 50' do
      it 'failure to register group' do
        subCatPro = SubCategoryProduct.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(subCatPro).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register SubCategoryProduct' do
        catPro = CategoryProduct.create(name: 'test catPro')
        subCatPro = SubCategoryProduct.create(name: 'test subCatPro', category_product_id: 2)
        expect(subCatPro).to be_valid
      end
    end
  end
end