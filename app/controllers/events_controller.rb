class EventsController < ApplicationController
  load_and_authorize_resource
  def index
    # @events = Event.all
  end

  def new
    # @event = Event.new
  end

  def create
    # @event = Event.new(event_params)
    @event.user_id = current_user.id 
    if @event.save
      redirect_to root_path, notice: 'event created'
    else
      render 'new'
    end 
  end

  def edit
    # @event = Event.find(params[:id])
  end

  def update
    # @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to calendar_path, notice: 'updates saved'
    else
      render 'edit', alert: 'updates not saved'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to calendar_path, notice: 'event removed'
  end

  private
    def event_params
      params.require(:event).permit(:date_time, :link, :venue, :other_artists)
    end
end