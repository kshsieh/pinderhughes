module ApplicationHelper
  
  def soundcloud_helper(id)
    raw("<iframe width='100%' height='100' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{id}&amp;color=049cdb&amp;auto_play=false&amp;show_artwork=false'></iframe>")
  end

  def soundcloud_track_id(link)
    client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
    track_url = link
    track = client.get('/resolve', url: track_url)
    track.id
  end

  def youtube_embed(link)
    link.sub(/(watch\?)/, 'embed/')
  end

  def youtube_helper(embed_link)
    raw("<iframe width='420' height='315' src='#{embed_link}' frameborder='0' allowfullscreen></iframe>")
  end

  def sms_helper
    sms = SocialMediaSite.all
  end
end
