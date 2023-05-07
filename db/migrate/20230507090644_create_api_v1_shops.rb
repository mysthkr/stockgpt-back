class CreateApiV1Shops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :prefecture

      t.timestamps
    end
  end
end
