class AddGroupRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :group, null: false, foreign_key: true
  end
end
