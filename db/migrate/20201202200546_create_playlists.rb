class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.integer :song_id
      t.integer :mood_id
      t.integer :songs_count

      t.timestamps
    end
  end
end
