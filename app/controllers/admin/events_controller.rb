# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    include EventsHelper

    before_action :ensure_admin
    before_action :set_event, only: %i[show edit update destroy]

    def index
      get_all_event
    end

    def show; end

    def new
      @event = Event.new
      @event.build_event_info
      @event.build_logo
    end

    def edit
      @event.build_logo if @event.logo.nil?
    end

    def create
      @event = Event.new(event_params)

      if @event.save
        redirect_to admin_event_path(@event.year),
                    notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event.year),
                    notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
    end

    private

    def ensure_admin
      super || return
    end

    def event_params
      params.require(:event).permit(
        :title,
        :subtitle,
        :overview,
        :year,
        :logo,
        event_info_attributes: %i[id synopsis description video_link],
        logo_attributes: %i[id file _destroy]
      )
        .tap { |event_params| event_params.require(:event_info_attributes) }
    end
  end
end
