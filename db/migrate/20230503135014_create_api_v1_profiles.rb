class CreateApiV1Profiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :nickname
      t.integer :roommate_number, default: 1, null: false
      t.string :prefecture

      t.timestamps
    end
  end
end
