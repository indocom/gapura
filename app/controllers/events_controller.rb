class EventsController < ApplicationController
  include EventsHelper
  include UrlHelper

  def index
    get_all_event
  end

  def show
    set_event
  end
end
