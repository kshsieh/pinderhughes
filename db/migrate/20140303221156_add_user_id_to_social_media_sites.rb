class AddUserIdToSocialMediaSites < ActiveRecord::Migration
  def change
    add_column :social_media_sites, :user_id, :integer
  end
end
