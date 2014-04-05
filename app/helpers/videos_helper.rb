module VideosHelper
  def youtube_embed(link)
    link.sub(/(watch\?)/, 'embed/')
  end
end