class AddGroupAndItemRefCriteriaDays < ActiveRecord::Migration[6.1]
  def change
    add_reference :criteria_days, :group, null: false, foreign_key: true
    add_reference :criteria_days, :item, null: false, foreign_key: true
  end
end
