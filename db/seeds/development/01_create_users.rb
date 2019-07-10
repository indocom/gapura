if User.find_by(username: 'admin').nil?
  admin = User.create(username: 'admin', email: 'admin@example.com',
  password: '123456', confirmed_at: DateTime.now)
  admin.add_role :admin
end

if User.find_by(username: 'user').nil?
  user = User.create(username: 'user', email: 'user@example.com',
  password: '123456', confirmed_at: DateTime.now)
end