class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.integer :song_id
      t.string :name
      t.integer :playlists_count

      t.timestamps
    end
  end
end
