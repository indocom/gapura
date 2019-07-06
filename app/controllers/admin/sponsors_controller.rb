class Admin::SponsorsController < ApplicationController
  before_action :set_event
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  # GET /admin/sponsors
  def index
    @sponsors = @event.sponsors
  end

  # GET /admin/sponsors/1
  def show
  end

  # GET /admin/sponsors/new
  def new
    @sponsor = @event.sponsors.build
  end

  # GET /admin/sponsors/1/edit
  def edit
  end

  # POST /admin/sponsors
  def create
    @sponsor = @event.sponsors.build(sponsor_params)

    if @sponsor.save
      redirect_to admin_event_sponsor_url(@event, @sponsor), notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sponsors/1
  def update
    if @sponsor.update(sponsor_params)
      redirect_to admin_event_sponsor_url(@event, @sponsor), notice: 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/sponsors/1
  def destroy
    @sponsor.destroy
    redirect_to admin_event_sponsors_path(@event), notice: 'Sponsor was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = @event.sponsors.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsor_params
      params.require(:sponsor).permit(:type, :name, :logo)
    end
end
