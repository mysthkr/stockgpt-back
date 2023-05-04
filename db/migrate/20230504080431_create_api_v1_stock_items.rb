class CreateApiV1StockItems < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_items do |t|
      t.bigint :group_id, null: false
      t.integer :criteria, null: false
      t.bigint :item_id, null: false
      t.date :alarm_date, null: false
      t.integer :price
      t.bigint :shop_id
      t.integer :quantity
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :stock_items, :discarded_at
  end
end
