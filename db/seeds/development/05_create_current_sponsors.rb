current_event = Event.find_by(year: DateTime.now.year)

9.times do |i|
  sponsor  = current_event.sponsors.create(
    name: "Sponsor #{i} for event #{current_event.year}", type: "Type #{i}"
  )

  filename = "sponsor-#{i % 3}.png"
  sponsor.logo.attach(
    io: get_mock_file(filename), filename: filename, content_type: 'image/png'
  )

  sponsor.save
end
