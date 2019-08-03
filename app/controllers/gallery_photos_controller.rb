class GalleryPhotosController < ApplicationController
  def index
    # if the id params is present
    @current_event = Event.find_by(year: current_year)
    if params[:total]
      # get all records with id less than 'our last id'
      # and limit the results to 8
      @gallery_photos = @current_event.gallery_photos.limit(8).offset(params[:total])
      @current_counted = params[:total].to_i() + @gallery_photos.count
    else
      @gallery_photos = @current_event.gallery_photos.limit(8)
      @current_counted = @gallery_photos.size
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end