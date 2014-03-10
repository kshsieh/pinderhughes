class CreatSocialMediaSites < ActiveRecord::Migration
  def change
    create_table :social_media_sites do |t|
      t.string :type
      t.string :string

      t.timestamps
    end
  end
end
