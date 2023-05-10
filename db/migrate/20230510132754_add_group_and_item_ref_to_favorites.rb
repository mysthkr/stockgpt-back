class AddGroupAndItemRefToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :group, null: false, foreign_key: true
    add_reference :favorites, :item, null: false, foreign_key: true
  end
end
