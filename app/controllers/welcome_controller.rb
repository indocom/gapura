class WelcomeController < ApplicationController
  def index
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
  end
end
