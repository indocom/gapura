Event.all.each do |event|
  for i in event.gallery_photos.count..14 do
    gallery_photo = event.gallery_photos.build
    filename = "gallery_photo-#{i % 3}.png"
    gallery_photo.build_image({
      data: get_binary_data(filename),
      mime_type: get_image_mime_type(filename),
      filename: filename,
    })
    gallery_photo.save
    gallery_photo.image_link = Rails.application.routes.url_helpers
      .serve_image_url(gallery_photo.image, only_path: true)
    gallery_photo.save
  end
end
