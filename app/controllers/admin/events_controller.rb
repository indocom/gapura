class Admin::EventsController < ApplicationController
  include EventsHelper

  before_action :ensure_admin
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    get_all_event
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_event_info
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to admin_event_path(@event.year), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event.year), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def ensure_admin
      super || return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :subtitle, :overview, :year, :logo,
        event_info_attributes: [:id, :synopsis, :description, :video_link])
        .tap do|event_params|
          event_params.require(:event_info_attributes)
        end
    end
end
