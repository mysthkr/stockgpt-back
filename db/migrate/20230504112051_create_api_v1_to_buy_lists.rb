class CreateApiV1ToBuyLists < ActiveRecord::Migration[6.1]
  def change
    create_table :to_buy_lists do |t|
      t.boolean :buy_flag, default: false
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :to_buy_lists, :discarded_at
  end
end
