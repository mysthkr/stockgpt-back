class AddGroupRefToStockItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :stock_items, :group, null: false, foreign_key: true
    add_reference :stock_items, :item, null: false, foreign_key: true
    add_reference :stock_items, :shop,  foreign_key: true
  end
end
