module TracksHelper
  def soundcloud_track_id(link)
    client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
    track_url = link
    track = client.get('/resolve', url: track_url)
    track.id
  end
end