class PlaylistsController < ApplicationController
  def index
    matching_playlists = Playlist.all

    @list_of_playlists = matching_playlists.order({ :created_at => :desc })

    render({ :template => "playlists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_playlists = Playlist.where({ :id => the_id })

    @the_playlist = matching_playlists.at(0)

    render({ :template => "playlists/show.html.erb" })
  end

  def create
    the_playlist = Playlist.new
    the_playlist.song_id = params.fetch("query_song_id")
    the_playlist.mood_id = params.fetch("query_mood_id")
    the_playlist.songs_count = params.fetch("query_songs_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists", { :notice => "Playlist created successfully." })
    else
      redirect_to("/playlists", { :notice => "Playlist failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.song_id = params.fetch("query_song_id")
    the_playlist.mood_id = params.fetch("query_mood_id")
    the_playlist.songs_count = params.fetch("query_songs_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists/#{the_playlist.id}", { :notice => "Playlist updated successfully."} )
    else
      redirect_to("/playlists/#{the_playlist.id}", { :alert => "Playlist failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.destroy

    redirect_to("/playlists", { :notice => "Playlist deleted successfully."} )
  end
end
