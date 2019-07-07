class WelcomeController < ApplicationController
  def index
    @testimonies = Testimony.all
  end
end
