module VideosHelper
  def youtube_embed(link)
    link.insert(0,'//')
    link.sub(/(watch\?v=)/, 'embed/')
  end
end