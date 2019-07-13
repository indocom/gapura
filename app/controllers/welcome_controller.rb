class WelcomeController < ApplicationController
  def index
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = Event.find_by(year: current_year).sponsors
  rescue
    not_found
  end
end
