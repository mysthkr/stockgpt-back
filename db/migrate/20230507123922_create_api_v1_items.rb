class CreateApiV1Items < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :criteria, null: false

      t.timestamps
    end
  end
end