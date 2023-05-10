class CreateApiV1CriteriaDays < ActiveRecord::Migration[6.1]
  def change
    create_table :criteria_days do |t|
      t.integer :criteria, null: false

      t.timestamps
    end
  end
end
