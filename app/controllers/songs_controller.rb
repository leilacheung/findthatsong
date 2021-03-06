class SongsController < ApplicationController
  
  def index
    matching_songs = @current_user.songs

    @list_of_songs = matching_songs.order({ :created_at => :desc })

    render({ :template => "songs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_songs = Song.where({ :id => the_id })

    @the_song = matching_songs.at(0)

    render({ :template => "songs/show.html.erb" })
  end

  def create
    the_song = Song.new
    the_song.title = params.fetch("query_title_id")
    the_song.artist = params.fetch("query_artist_id")
    the_song.playlist_id = params.fetch("query_playlist_id")
    the_song.user_id = @current_user.id

    if the_song.valid?
      the_song.save
      redirect_to("/songs", { :notice => "Song created successfully." })
    else
      redirect_to("/songs", { :alert => "Song failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_song = Song.where({ :id => the_id }).at(0)

    the_song.title = params.fetch("query_title_id")
    the_song.artist = params.fetch("query_artist_id")
    the_song.playlist_id = params.fetch("query_playlist_id")

    if the_song.valid?
      the_song.save
      redirect_to("/songs/#{the_song.id}", { :notice => "Song updated successfully."} )
    else
      redirect_to("/songs/#{the_song.id}", { :alert => "Song failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_song = Song.where({ :id => the_id }).at(0)

    the_song.destroy

    redirect_to("/songs", { :notice => "Song deleted successfully."} )
  end
end
