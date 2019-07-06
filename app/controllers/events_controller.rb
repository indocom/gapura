class EventsController < ApplicationController
  include EventsHelper

  # GET /events
  def index
    get_all_event
  end

  # GET /events/1
  def show
    set_event
  end
end
