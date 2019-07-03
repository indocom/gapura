class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.order(year: :desc)
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id]) rescue not_found
  end
end
