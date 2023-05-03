class CreateApiV1CategoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :category_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
