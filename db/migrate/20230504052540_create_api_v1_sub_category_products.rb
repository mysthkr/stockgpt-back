class CreateApiV1SubCategoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_category_products do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
