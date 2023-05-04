class AddCategoryGroceryRefToSubCategoryGroceries < ActiveRecord::Migration[6.1]
  def change
    add_reference :sub_category_groceries, :category_grocery, null: false, foreign_key: true
  end
end
