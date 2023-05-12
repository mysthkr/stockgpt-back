class AddGroupAndItemRefToToBuyList < ActiveRecord::Migration[6.1]
  def change
    add_reference :to_buy_lists, :group, null: false, foreign_key: true
    add_reference :to_buy_lists, :item, null: false, foreign_key: true
  end
end
