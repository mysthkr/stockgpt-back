class CreateApiV1Favorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :group_id, null: false
      t.bigint :item_id, null: false

      t.timestamps
    end
  end
end
