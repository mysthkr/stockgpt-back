class CreateApiV1Invitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.bigint :group_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
