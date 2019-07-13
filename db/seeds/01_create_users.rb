superuser = User.find_by(username: ENV['SUPERUSER_USERNAME'])
if (superuser.nil?)
  superuser = User.create(username: ENV['SUPERUSER_USERNAME'], email: ENV['SUPERUSER_EMAIL'],
                          password: ENV['SUPERUSER_PASSWORD'], confirmed_at: DateTime.now)
  superuser.add_role :admin
  superuser.add_role :superuser
end

admin = User.find_by(username: ENV['ADMIN_USERNAME'])
if (admin.nil?)
  admin = User.create(username: ENV['ADMIN_USERNAME'], email: ENV['ADMIN_EMAIL'],
                      password: ENV['ADMIN_PASSWORD'], confirmed_at: DateTime.now)
  admin.add_role :admin
end
