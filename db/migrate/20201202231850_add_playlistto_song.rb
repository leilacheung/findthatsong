class AddPlaylisttoSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :playlist, :string
  end
end
