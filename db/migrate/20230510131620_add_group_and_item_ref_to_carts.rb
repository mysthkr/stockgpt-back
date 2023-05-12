class AddGroupAndItemRefToCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :group, null: false, foreign_key: true
    add_reference :carts, :item, null: false, foreign_key: true
  end
end
