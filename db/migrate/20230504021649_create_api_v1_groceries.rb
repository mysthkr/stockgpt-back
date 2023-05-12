class CreateApiV1Groceries < ActiveRecord::Migration[6.1]
  def change
    create_table :groceries do |t|

      t.timestamps
    end
  end
end
