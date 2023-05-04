class CreateApiV1Products < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :item_id, null: false
      t.bigint :subcategory_id, null: false
      t.bigint :category_id, null: false
      t.bigint :maker_id
      t.string :picture, default: "default.png"

      t.timestamps
    end
  end
end
