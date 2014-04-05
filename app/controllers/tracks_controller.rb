class TracksController < PagesController
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find params[:id]
  end
end