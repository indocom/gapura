# frozen_string_literal: true

class WelcomeController < ApplicationController
  include UrlHelper

  def index
    @current_event = Event.find_by(year: current_year)
    @testimonies = Testimony.all
    @faqs = FrequentlyAskedQuestion.all
    @partners = @current_event.sponsors.order(:type)
    @gallery_photos = @current_event.gallery_photos.limit(8)
    @more_photos = @current_event.gallery_photos.count > 8
  rescue StandardError
    not_found
  end

  def sold_out_night; end

  def sold_out_matinee; end

  def buy_special; end

  def serve_booklet
    redirect_to 'https://drive.google.com/file/d/1hJBw_ELtPFxLiCPpJ3-zLQ2Vpo-ooWNp/view?usp=sharing'
  end
end
