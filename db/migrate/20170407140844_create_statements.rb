class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.string :title
      t.string :text
      t.timestamps
    end
  end
end
