class Admin::SocialMediaSitesController < Admin::BaseController

  before_filter :load_social_media_sites, only: [:edit, :update]
  def index
    @social_media_sites = SocialMediaSite.all
  end

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

  def edit
  end

  def update
    if @social_media_site.update_attributes(social_media_site_params)
      redirect_to root_path, notice: 'site updated'
    else 
      render 'edit', alert: 'update failed, try again'
    end
  end

  def destroy
    SocialMediaSite.find(params[:id]).destroy
    redirect_to root_path, notice: 'site destroyed'
  end

  private
    def load_social_media_sites
      @social_media_site = SocialMediaSite.find(params[:id])
    end

    def social_media_site_params
      params.require(:social_media_site).permit(:site_name, :link, :user_id)
    end
end