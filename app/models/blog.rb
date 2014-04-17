# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  entry      :text
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base

  validates :title, presence: true
  validates :entry, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
