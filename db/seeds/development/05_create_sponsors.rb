Event.all.each do |event|
  for i in event.sponsors.count..8
    sponsor  = event.sponsors.build(
      name: "Sponsor #{i} for event #{event.year}", type: "Type #{i}"
    )

    filename = "sponsor-#{i % 3}.png"
    sponsor.logo.attach(
      io: get_mock_file(filename), filename: filename, content_type: 'image/png'
    )

    sponsor.save
  end
end
