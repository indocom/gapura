class ImagesController < ApplicationController
  def serve
    @image = Image.find(params[:id])
    send_data(@image.data, type: @image.mime_type, filename: @image.filename, disposition: 'inline')
  rescue
    not_found
  end
end
