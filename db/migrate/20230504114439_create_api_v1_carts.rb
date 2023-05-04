class CreateApiV1Carts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :group_id, null: false
      t.bigint :item_id, null: false
      t.integer :criteria, null: false
      t.integer :price
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :carts, :discarded_at
  end
end
