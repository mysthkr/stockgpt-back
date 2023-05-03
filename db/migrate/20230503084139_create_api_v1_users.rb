class CreateApiV1Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.bigint :group_id
      t.string :encrypted_password
      t.boolean :admin
      t.boolean :business

      t.timestamps
    end
  end
end
