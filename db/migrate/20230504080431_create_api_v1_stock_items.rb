class CreateApiV1StockItems < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_items do |t|
      t.integer :criteria, null: false
      t.date :alarm_date, null: false
      t.integer :price
      t.integer :quantity
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :stock_items, :discarded_at
  end
end
