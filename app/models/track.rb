class Track < ActiveRecord::Base

  validates :link, presence: true 
  validates :name, presence: true 
  validates :user_id, presence: true

  belongs_to :user

end
