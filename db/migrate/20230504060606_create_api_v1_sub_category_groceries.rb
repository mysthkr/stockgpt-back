class CreateApiV1SubCategoryGroceries < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_category_groceries do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
