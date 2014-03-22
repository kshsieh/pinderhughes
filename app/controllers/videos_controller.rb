class VideosController < ApplicationController
  load_and_authorize_resource
  def index
    # @videos = Video.all
  end

  def new
    # @video = Video.new
  end

  def create
    # @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to videos_path, notice: 'video link saved'
    else
      render 'new', alert: 'video link not saved'
    end
  end

  def edit
    # @video = Video.find(params[:id])
  end

  def update
    # @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to videos_path, notice: 'video link updated'
    else
      render 'edit', alert: 'video link not updated. try again'
    end
  end

  def destroy
    Video.find(params[:id]).destroy
    redirect_to videos_path, notice: 'video link destroyed'
  end

  private
    def video_params
      params.require(:video).permit(:title, :link, :user_id)
    end
end