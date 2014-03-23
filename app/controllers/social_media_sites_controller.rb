class SocialMediaSitesController < ApplicationController
  def index
    @social_media_sites = SocialMediaSite.all
  end

  def show
    @social_media_site = SocialMediaSite.find(params[:id])
  end
end