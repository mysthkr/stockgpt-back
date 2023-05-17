require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    context 'item id is empty' do
      it 'failure to register product' do
        product = Product.create(category_product_id: 1, sub_category_product_id: 1)
        expect(product).not_to be_valid
      end
    end

    context 'category_id is empty' do
      it 'failure to register product' do
        product = Product.create(item_id: 1, sub_category_product_id: 1)
        expect(product).not_to be_valid
      end
    end

    context 'sub_category_id is empty' do
      it 'failure to register product' do
        product = Product.create(item_id: 1, category_product_id: 1)
        expect(product).not_to be_valid
      end
    end

    context 'enter all info without maker' do
      it 'success to register product' do
        item = Item.create(name: 'testname', criteria: 100)
        catPro = CategoryProduct.create(name: 'test catPro')
        subCatPro = SubCategoryProduct.create(name: 'test subCatPro', category_product_id: catPro.id)
        product = Product.create(item_id: item.id, category_product_id: catPro.id, sub_category_product_id: subCatPro.id)
        expect(product).to be_valid
      end
    end

    context 'enter all info with maker' do
      it 'success to register product' do
        item = Item.create(name: 'testname', criteria: 100)
        catPro = CategoryProduct.create(name: 'test catPro')
        subCatPro = SubCategoryProduct.create(name: 'test subCatPro', category_product_id: catPro.id)
        maker = Maker.create(name: 'test maker')
        product = Product.create(item_id: item.id, category_product_id: catPro.id, sub_category_product_id: subCatPro.id, maker_id: maker.id)
        expect(product).to be_valid
      end
    end
  end
end