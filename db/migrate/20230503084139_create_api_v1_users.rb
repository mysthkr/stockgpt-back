class CreateApiV1Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.boolean :admin, default: false
      t.boolean :business, default: false

      t.timestamps
    end
  end
end
