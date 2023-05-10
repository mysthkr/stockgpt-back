class CreateApiV1Products < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :picture, default: "default.png"

      t.timestamps
    end
  end
end
