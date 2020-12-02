# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  artist      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#  user_id     :integer
#
class Song < ApplicationRecord
  belongs_to(:listener, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:playlist, { :required => false, :class_name => "Playlist", :foreign_key => "playlist_id", :counter_cache => true })
end
