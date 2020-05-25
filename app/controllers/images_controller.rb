# frozen_string_literal: true

class ImagesController < ApplicationController
  def serve
    @image = Image.find(params[:id])
    send_data(
      @image.data,
      type: @image.mime_type, filename: @image.filename, disposition: 'inline'
    )
  rescue StandardError
    not_found
  end
end
