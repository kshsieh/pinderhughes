module VideosHelper
  def youtube_embed(link)
    link.sub!(/\A(https*:\/\/)/, '')
    link.prepend('//')
    link.sub(/(watch\?v=)/, 'embed/')
  end
end