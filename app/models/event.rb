class Event < ActiveRecord::Base

  validates :date_time, presence: true, in_the_future: true
  validates :venue, presence: true
  validates :user_id, presence: true

  belongs_to :user
end