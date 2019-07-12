Event.all.each do |event|
  for i in event.gallery_photos.count..14 do
    gallery_photo = event.gallery_photos.build
    filename = "gallery_photo-#{i % 3}.png"
    gallery_photo.image.attach(
      io: get_mock_file(filename), filename: filename, content_type: 'image/png'
    )
    gallery_photo.image_link = Rails.application.routes.url_helpers
      .rails_blob_path(gallery_photo.image, only_path: true)
    gallery_photo.save
  end
end
