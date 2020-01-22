# frozen_string_literal: true

module Admin
  class EventPreviewsController < ApplicationController
    include EventsHelper

    before_action :ensure_admin
    before_action :set_event

    def index
      @event_previews = @event.event_previews
    end

    def new
      @event_preview = @event.event_previews.build
      @event_preview.build_image
    end

    def edit
      @event_preview = @event.event_previews.find(params[:id])
      @event_preview.build_image if @event_preview.image.nil?
    end

    def create
      @event_preview = @event.event_previews.build(event_preview_params)
      if @event_preview.save
        redirect_to admin_event_event_previews_path,
                    notice: 'Event preview was successfully created.'
      else
        @event_preview.build_image
        render :new
      end
    end

    def update
      @event_preview = @event.event_previews.find(params[:id])
      if @event_preview.update(event_preview_params)
        redirect_to admin_event_event_previews_path,
                    notice: 'Event preview was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @event_preview = @event.event_previews.find(params[:id])
      @event_preview.destroy
      redirect_to admin_event_event_previews_path(@event.year),
                  notice: 'Event preview was successfully destroyed.'
    end

    private

    def event_preview_params
      params.require(:event_preview).permit(
        :preview_info,
        :image_link,
        image_attributes: %i[id file _destroy]
      )
    end
  end
end
