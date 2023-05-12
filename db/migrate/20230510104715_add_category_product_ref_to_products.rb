class AddCategoryProductRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category_product, null: false, foreign_key: true
    add_reference :products, :sub_category_product, null: false, foreign_key: true
    add_reference :products, :item, null: false, foreign_key: true
    add_reference :products, :maker, null: false, foreign_key: true
  end
end
