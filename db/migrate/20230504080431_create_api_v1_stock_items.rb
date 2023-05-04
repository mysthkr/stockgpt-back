class CreateApiV1StockItems < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_items do |t|
      t.bigint :group_id
      t.integer :criteria
      t.bigint :item_id
      t.date :alarm_date
      t.integer :price
      t.bigint :shop_id
      t.integer :quantity
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :stock_items, :discarded_at
  end
end
