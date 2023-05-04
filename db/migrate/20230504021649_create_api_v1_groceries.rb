class CreateApiV1Groceries < ActiveRecord::Migration[6.1]
  def change
    create_table :groceries do |t|
      t.bigint :item_id
      t.bigint :subcategory_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
