# == Schema Information
#
# Table name: moods
#
#  id              :integer          not null, primary key
#  label           :string
#  name            :string
#  playlists_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  song_id         :integer
#
class Mood < ApplicationRecord
  has_many(:playlists, { :class_name => "Playlist", :foreign_key => "mood_id", :dependent => :nullify })

  validates(:label, { :presence => true })
  validates(:label, { :uniqueness => true })
  
end
