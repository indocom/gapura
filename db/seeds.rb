# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

superuser = User.create(username: ENV['DEFAULT_USERNAME'], email: ENV['DEFAULT_EMAIL'],
                        password: ENV['DEFAULT_PASSWORD'], confirmed_at: DateTime.now)
superuser.add_role :admin
superuser.add_role :superuser

if (Rails.env == "development")
  admin = User.create(username: 'admin', email: 'admin@example.com',
                      password: '123456', confirmed_at: DateTime.now)
  admin.add_role :admin

  user = User.create(username: 'user', email: 'user@example.com',
                     password: '123456', confirmed_at: DateTime.now)

  10.times do |i|
    testimonial = Testimony.create(name: "Pokemon #{i}", profession: "Audience #{i}",
                                   testimony: "Good #{i}. " * 20)
    testimonial.photo.attach(
      io: File.open( Rails.root.join('app', 'assets', 'images', 'testimonials', "testimonial-#{i % 3}.png")),
      filename: "testimonial-#{i % 3}.png", content_type: 'image/png'
    )

    testimonial.save
  end
end