# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

superuser = User.create(username: 'superuser', email: 'superuser@example.com',
                        password: '123456', confirmed_at: DateTime.now)
superuser.add_role :admin
superuser.add_role :superuser

admin = User.create(username: 'admin', email: 'admin@example.com',
                    password: '123456', confirmed_at: DateTime.now)
admin.add_role :admin

user = User.create(username: 'user', email: 'user@example.com',
                    password: '123456', confirmed_at: DateTime.now)
