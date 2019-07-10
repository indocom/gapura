9.times do |i|
  testimonial = Testimony.create(name: "Pokemon #{i}", profession: "Audience #{i}",
                                  testimony: "Good #{i}. " * 20)
  testimonial.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'mock_datas', "testimonial-#{i % 3}.png")),
    filename: "testimonial-#{i % 3}.png", content_type: 'image/png'
  )

  testimonial.save
end
