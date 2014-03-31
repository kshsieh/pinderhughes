class SocialMediaSite < ActiveRecord::Base
  belongs_to :user

  validates :site_name, presence: true, 
                        inclusion: {in: %w(facebook instagram tumblr twitter),
                          message: "Please select from list"}
  validates :link,      presence: true
  validates :user_id,   presence: true
end
