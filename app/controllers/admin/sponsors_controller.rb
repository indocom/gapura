class Admin::SponsorsController < ApplicationController
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
  end

  def edit
  end

  def create
    @sponsor = @event.sponsors.build(sponsor_params)

    if @sponsor.save
      redirect_to admin_event_sponsor_url(@event, @sponsor), notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to admin_event_sponsor_url(@event, @sponsor), notice: 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sponsor.destroy
    redirect_to admin_event_sponsors_path(@event), notice: 'Sponsor was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_sponsor
      @sponsor = @event.sponsors.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:type, :name, :logo)
    end
end
