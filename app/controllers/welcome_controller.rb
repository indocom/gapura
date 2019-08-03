class WelcomeController < ApplicationController
  include UrlHelper

  def index
    @current_event = Event.find_by(year: current_year)
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = Event.find_by(year: current_year).sponsors

    if params[:total]
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
    rescue
      not found 
  end
end
