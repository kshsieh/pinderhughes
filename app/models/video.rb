# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  link       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Video < ActiveRecord::Base
  
  validates :link, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
