require 'rails_helper'

RSpec.describe Grocery, type: :model do
  describe 'Validation' do
    context 'item id is empty' do
      it 'failure to register grocery' do
        grocery = Grocery.create(category_grocery_id: 1, sub_category_grocery_id: 1)
        expect(grocery).not_to be_valid
      end
    end

    context 'category_id is empty' do
      it 'failure to register grocery' do
        grocery = Grocery.create(item_id: 1, sub_category_grocery_id: 1)
        expect(grocery).not_to be_valid
      end
    end

    context 'sub_category_id is empty' do
      it 'failure to register grocery' do
        grocery = Grocery.create(item_id: 1, category_grocery_id: 1)
        expect(grocery).not_to be_valid
      end
    end

    context 'enter all info' do
      it 'success to register grocery' do
        item = Item.create(name: 'testname', criteria: 100)
        catGro = CategoryGrocery.create(name: 'test catGro')
        subCatGro = SubCategoryGrocery.create(name: 'test subCatGro', category_grocery_id: catGro.id)
        grocery = Grocery.create(item_id: item.id, category_grocery_id: catGro.id, sub_category_grocery_id: subCatGro.id)
        expect(grocery).to be_valid
      end
    end
  end
end