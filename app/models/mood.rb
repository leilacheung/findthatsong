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
#  user_id         :integer
#
class Mood < ApplicationRecord

  validates(:label, { :presence => true })
  validates(:label, { :uniqueness => true })

  has_many(:playlists, { :class_name => "Playlist", :foreign_key => "mood_id", :dependent => :nullify })
  belongs_to(:listener, { :required => true, :class_name => "User", :foreign_key => "user_id" })



  
end
