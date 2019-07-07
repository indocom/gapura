class WelcomeController < ApplicationController
  def index
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = Sponsor.all
  end
end
