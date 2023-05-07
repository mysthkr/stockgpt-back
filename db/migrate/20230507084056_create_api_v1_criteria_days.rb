class CreateApiV1CriteriaDays < ActiveRecord::Migration[6.1]
  def change
    create_table :criteria_days do |t|
      t.bigint :group_id, null: false
      t.bigint :item_id, null: false
      t.integer :criteria, null: false

      t.timestamps
    end
  end
end
