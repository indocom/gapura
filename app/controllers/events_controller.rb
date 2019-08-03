class EventsController < ApplicationController
  include EventsHelper
  include UrlHelper

  def index
    get_all_event
  end

  def show
    set_event
  end

  def load_photos
    year = current_year
    year = params[:year].to_i if params[:year]
    year = params[:event_year].to_i if params[:event_year]

    offset = params[:offset].nil? ? 0 : params[:offset].to_i
    take = params[:take].nil? ? 8 : params[:take].to_i

    event = Event.find_by(year: year)

    @gallery_photos = event.gallery_photos.offset(offset).limit(take)
    @more_photos = (offset + take) < event.gallery_photos.count

    respond_to do |format|
      format.js
    end
  end
end
