class FixLinkColumnName < ActiveRecord::Migration
  def change
    rename_column :social_media_sites, :string, :link
  end
end
