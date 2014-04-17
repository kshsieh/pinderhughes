# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  date_time     :datetime
#  link          :string(255)
#  venue         :string(255)
#  other_artists :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#

class Event < ActiveRecord::Base

  validates :date_time, presence: true, in_the_future: true
  validates :venue, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
