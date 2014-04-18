# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  link       :string(255)
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  update_at  :datetime
#

class Track < ActiveRecord::Base

  validates :link, presence: true 
  validates :name, presence: true 
  validates :user_id, presence: true

  belongs_to :user

  def soundcloud_track_id(link)
    client = Soundcloud.new(client_id: "7740ceb86c3e214878ebdc0c7df4da6e")
    track_url = link
    track = client.get('/resolve', url: track_url)
    track.id
  end

end
