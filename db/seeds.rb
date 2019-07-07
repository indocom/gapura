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

  9.times do |i|
    testimonial = Testimony.create(name: "Pokemon #{i}", profession: "Audience #{i}",
                                   testimony: "Good #{i}. " * 20)
    testimonial.photo.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'mock_datas', "testimonial-#{i % 3}.png")),
      filename: "testimonial-#{i % 3}.png", content_type: 'image/png'
    )

    testimonial.save
  end

  10.times do |i|
    FrequentlyAskedQuestion.create(question: "Question #{i} " * 5 + "?", answer: "Answer #{i} " * 20 + "." )
  end

  current_event = Event.create(title: 'Title', subtitle: 'Subtitle', year: 2019, overview: 'Overview')
  current_event.create_event_info(synopsis: 'Synopsis', description: 'Description', video_link: 'www.youtube.com')

  9.times do |i|
    sponsor  = current_event.sponsors.create(
      name: "Sponsor #{i} for event #{current_event.year}", type: "Type #{i}"
    )

    sponsor.logo.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'mock_datas', "sponsor-#{i % 3}.png")),
      filename: "sponsor-#{i % 3}.png", content_type: 'image/png'
    )

    sponsor.save
  end
end