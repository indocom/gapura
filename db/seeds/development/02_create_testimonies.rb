for i in Testimony.count..11 do
  testimonial = Testimony.new(name: "Pokemon #{i}", profession: "Audience #{i}",
                                  testimony: "Good #{i}. " * 20)

  filename = "testimonial-#{i % 3}.png"
  testimonial.photo.attach(
    io: get_mock_file(filename), filename: filename, content_type: 'image/png'
  )

  testimonial.save
end
