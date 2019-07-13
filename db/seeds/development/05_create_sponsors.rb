Event.all.each do |event|
  for i in event.sponsors.count..8
    sponsor  = event.sponsors.build(
      name: "Sponsor #{i} for event #{event.year}", type: "Type #{i}"
    )

    filename = "sponsor-#{i % 3}.png"
    sponsor.build_logo({
      data: get_binary_data(filename),
      mime_type: get_image_mime_type(filename),
      filename: filename,
    })
    sponsor.save
  end
end
