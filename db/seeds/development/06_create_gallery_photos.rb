# frozen_string_literal: true

Event.all.each do |event|
  (event.gallery_photos.count..14).each do |i|
    gallery_photo = event.gallery_photos.build
    filename = "gallery_photo-#{i % 3}.png"
    gallery_photo.build_image(
      data: get_binary_data(filename),
      mime_type: get_image_mime_type(filename),
      filename: filename
    )
    gallery_photo.save
  end
end
