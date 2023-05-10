class CreateApiV1Requests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :request_type, null: false
      t.string :request_name, null: false
      t.boolean :register_flag, default: false

      t.timestamps
    end
  end
end
