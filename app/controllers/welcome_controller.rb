class WelcomeController < ApplicationController
  def index
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = Event.find_by(year: 2019).sponsors
    # if the id params is present
    if params[:year]
      # get all records with id less than 'our last id'
      # and limit the results to 5
      @scroll_photos = ScrollPhoto.where('year < ?', params[:year]).limit(8)
    else
      @scroll_photos = ScrollPhoto.limit(8)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
