class SocialMediaSite < ActiveRecord::Base
  belongs_to :user

  validates :site_name, presence: true
  validates :link,      presence: true
  validates :user_id,   presence: true
end
