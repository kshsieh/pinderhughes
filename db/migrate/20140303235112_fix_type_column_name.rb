class FixTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :social_media_sites, :type, :site_name
  end
end
