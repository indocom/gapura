class Admin::GalleryPhotosController < ApplicationController
  before_action :set_event

  # GET /admin/gallery_photos
  def index
    @gallery_photos = @event.gallery_photos.order(created_at: :desc)
  end

  def new
    @gallery_photo = @event.gallery_photos.build
  end

  # POST /admin/gallery_photos
  def create
    @gallery_photo = @event.gallery_photos.build(gallery_photo_params)
    if @gallery_photo.save
      if @gallery_photo.image.attached?
        @gallery_photo.image_link = url_for(@gallery_photo.image)
        @gallery_photo.save
      end

      redirect_to admin_event_gallery_photos_path, notice: 'Gallery photo was successfully created.'
    else
      render :new
    end
  end

  # DELETE /admin/gallery_photos/1
  def destroy
    @gallery_photo = @event.gallery_photos.find(params[:id])
    @gallery_photo.destroy
    redirect_to admin_event_gallery_photos_path(@event), notice: 'Gallery photo was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_photo_params
      params.require(:gallery_photo).permit(:image, :image_link)
    end
end
