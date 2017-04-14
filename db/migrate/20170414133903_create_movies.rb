class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :length
      t.string :poster
      t.string :filename

      t.timestamps
    end
  end
end
