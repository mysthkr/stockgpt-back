class AddCategoryGroceryRefToGroceries < ActiveRecord::Migration[6.1]
  def change
    add_reference :groceries, :category_grocery, null: false, foreign_key: true
    add_reference :groceries, :sub_category_grocery, null: false, foreign_key: true
    add_reference :groceries, :item, null: false, foreign_key: true
  end
end
