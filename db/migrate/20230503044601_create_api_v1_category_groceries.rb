class CreateApiV1CategoryGroceries < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_category_groceries do |t|
      t.string :name

      t.timestamps
    end
  end
end
