class WelcomeController < ApplicationController
  include UrlHelper

  def index
    @current_event = Event.find_by(year: current_year)
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = @current_event.sponsors
    @gallery_photos = @current_event.gallery_photos.limit(8)
  rescue
    not_found
  end
end
