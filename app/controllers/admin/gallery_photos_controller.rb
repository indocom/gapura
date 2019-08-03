module Admin
  class GalleryPhotosController < ApplicationController
    include EventsHelper

    before_action :ensure_admin
    before_action :set_event

    def index
      @gallery_photos = @event.gallery_photos.order(created_at: :desc)
    end

    def new
      @gallery_photo = @event.gallery_photos.build
      @gallery_photo.build_image
    end

    def create
      @gallery_photo = @event.gallery_photos.build(gallery_photo_params)
      if @gallery_photo.save
        redirect_to admin_event_gallery_photos_path, notice: 'Gallery photo was successfully created.'
      else
        @gallery_photo.build_image
        render :new
      end
    end

    def destroy
      @gallery_photo = @event.gallery_photos.find(params[:id])
      @gallery_photo.destroy
      redirect_to admin_event_gallery_photos_path(@event.year), notice: 'Gallery photo was successfully destroyed.'
    end

    private
      def gallery_photo_params
        params.require(:gallery_photo).permit(:image_link, image_attributes: [:id, :file, :_destroy])
      end
  end
end
