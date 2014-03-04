class SocialMediaSitesController < ApplicationController

  def new
    @social_media_site = SocialMediaSite.new

  end

  def create
    @social_media_site = SocialMediaSite.new(social_media_site_params)
    @social_media_site.user_id = current_user.id
    if @social_media_site.save
      redirect_to root_path, notice: 'site added succesfully'
    else
      render 'new', alert: 'site not saved. try again.'
    end
  end

  private
    def social_media_site_params
      params.require(:social_media_site).permit(:site_name, :link, :user_id)
    end
end