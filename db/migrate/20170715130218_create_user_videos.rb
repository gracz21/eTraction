class CreateUserVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_videos do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :video
      t.string :title

      t.timestamps
    end
  end
end
