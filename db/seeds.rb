# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
users = User.create([{ email: 'a@gmail.com', password: 'password' },
                     { email: 'b@gmail.com', password: 'password' },
                     { email: 'c@gmail.com', password: 'password' },
                     { email: 'd@gmail.com', password: 'password' },
                     { email: 'e@gmail.com', password: 'password' },
                     { email: 'f@gmail.com', password: 'password' }])
