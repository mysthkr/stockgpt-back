class CreateApiV1Groups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
