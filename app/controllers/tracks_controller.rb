class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.user_id = current_user.id
    if @track.save
      redirect_to root_path, notice: 'track added'
    else
      render :new, alert: 'track not saved'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to listen_path, notice: 'track updated'
    else
      render 'edit', alert: 'updates not saved'
    end
  end

  def destroy
    Track.find(params[:id]).destroy
    redirect_to listen_path
  end

  private
    def track_params
      params.require(:track).permit(:link, :name, :user_id)
    end
end