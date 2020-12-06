# == Schema Information
#
# Table name: playlists
#
#  id          :integer          not null, primary key
#  songs_count :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mood_id     :integer
#  song_id     :integer
#  user_id     :string
#
class Playlist < ApplicationRecord

  has_many(:songs, { :class_name => "Song", :foreign_key => "playlist_id", :dependent => :nullify })
  belongs_to(:genre, { :required => false, :class_name => "Mood", :foreign_key => "mood_id", :counter_cache => true })

  validates(:title, { :presence => true })

  def vibe
  my_mood = self.mood_id

  matching_mood = Mood.where({ :id => my_mood}).first

  return matching_mood
  end

end
