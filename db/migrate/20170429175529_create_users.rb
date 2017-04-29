class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :device_id
      t.string :username

      t.timestamps
    end
    add_index :users, :device_id, unique: true
  end
end
