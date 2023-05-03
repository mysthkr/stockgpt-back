class CreateApiV1CategoryGroceries < ActiveRecord::Migration[6.1]
  def change
    create_table :category_groceries do |t|
      t.string :name

      t.timestamps
    end
  end
end
