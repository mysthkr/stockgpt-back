class CreateApiV1Profiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.bigint :user_id
      t.string :name
      t.string :nickname
      t.integer :roommate_number
      t.string :prefecture

      t.timestamps
    end
  end
end
