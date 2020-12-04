# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true

  validates :username, :uniqueness => { :case_sensitive => false }
  validates :username, :presence => true

  has_secure_password

  has_many(:songs, { :class_name => "Song", :foreign_key => "user_id", :dependent => :nullify })
end
