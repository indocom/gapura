# frozen_string_literal: true

(Testimony.count..11).each do |i|
  testimonial =
    Testimony.new(
      name: "Pokemon #{i}",
      profession: "Audience #{i}",
      testimony: "Good #{i}. " * 20
    )

  filename = "testimonial-#{i % 3}.png"
  testimonial.build_photo(
    data: get_binary_data(filename),
    mime_type: get_image_mime_type(filename),
    filename: filename
  )

  testimonial.save
end
