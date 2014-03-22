class Video < ActiveRecord::Base
  
  validates :link, presence: true
  validates :user_id, presence: true

  belongs_to :user
end