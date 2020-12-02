class AddTitletoPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :title, :string
  end
end
