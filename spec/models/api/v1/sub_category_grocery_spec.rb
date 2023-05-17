require 'rails_helper'

RSpec.describe SubCategoryGrocery, type: :model do
  describe 'Validation' do
        context 'name is greater than 50' do
      it 'failure to register SubCategoryGrocery' do
        subCatGro = SubCategoryGrocery.create(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        expect(subCatGro).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register SubCategoryGrocery' do
        catGro = CategoryGrocery.create(name: 'test catGro')
        subCatGro = SubCategoryGrocery.create(name: 'test subCatGro', category_grocery_id: catGro.id)
        expect(subCatGro).to be_valid
      end
    end
  end
end