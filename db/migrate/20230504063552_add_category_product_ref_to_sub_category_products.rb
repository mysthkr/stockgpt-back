class AddCategoryProductRefToSubCategoryProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :sub_category_products, :category_product, null: false, foreign_key: true
  end
end
