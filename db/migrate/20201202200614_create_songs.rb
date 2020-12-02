class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.integer :playlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
