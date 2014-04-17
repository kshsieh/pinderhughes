# == Schema Information
#
# Table name: social_media_sites
#
#  id         :integer          not null, primary key
#  site_name  :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class SocialMediaSite < ActiveRecord::Base
  belongs_to :user

  validates :site_name, presence: true, 
                        inclusion: {in: %w(facebook instagram tumblr twitter),
                          message: "Please select from list"}
  validates :link,      presence: true
  validates :user_id,   presence: true
end
