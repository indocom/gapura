module Admin
  class SponsorsController < ApplicationController
    include EventsHelper
    include UrlHelper

    before_action :ensure_admin
    before_action :set_event
    before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

    def index
      @sponsors = @event.sponsors
    end

    def show
    end

    def new
      @sponsor = @event.sponsors.build
      @sponsor.build_logo
    end

    def edit
      @sponsor.build_logo if @sponsor.logo.nil?
    end

    def create
      @sponsor = @event.sponsors.build(sponsor_params)

      if @sponsor.save
        redirect_to admin_event_sponsor_url(@event.year, @sponsor), notice: 'Sponsor was successfully created.'
      else
        render :new
      end
    end

    def update
      if @sponsor.update(sponsor_params)
        redirect_to admin_event_sponsor_url(@event.year, @sponsor), notice: 'Sponsor was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sponsor.destroy
      redirect_to admin_event_sponsors_path(@event.year), notice: 'Sponsor was successfully destroyed.'
    end

    private
      def set_sponsor
        @sponsor = @event.sponsors.find(params[:id])
      end

      def sponsor_params
        params.require(:sponsor).permit(:type, :name, :link, logo_attributes: [:id, :file, :_destroy])
      end
  end
end
