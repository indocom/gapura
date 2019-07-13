class EventsController < ApplicationController
  include EventsHelper

  def index
    get_all_event
  end

  def show
    set_event
  end
end
