# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ email: 'a@gmail.com', password: 'password' },
             { email: 'b@gmail.com', password: 'password' },
             { email: 'c@gmail.com', password: 'password' },
             { email: 'd@gmail.com', password: 'password' },
             { email: 'e@gmail.com', password: 'password' },
             { email: 'f@gmail.com', password: 'password' }])

Follower.create([{ user_id: 2, follower_id: 1 },
                 { user_id: 3, follower_id: 1 },
                 { user_id: 4, follower_id: 1 },
                 { user_id: 5, follower_id: 1 },
                 { user_id: 6, follower_id: 1 },
                 { user_id: 4, follower_id: 5 },
                 { user_id: 3, follower_id: 2 }])

Tweet.create([{ user_id: 1, body: 'awesome tweet' },
              { user_id: 2, body: 'awesome tweet' },
              { user_id: 3, body: 'awesome tweet' },
              { user_id: 4, body: 'awesome tweet' },
              { user_id: 5, body: 'awesome tweet' },
              { user_id: 6, body: 'awesome tweet' }])

Like.create([{ user_id: 1, tweet_id: 1 },
             { user_id: 1, tweet_id: 2 },
             { user_id: 1, tweet_id: 3 },
             { user_id: 1, tweet_id: 4 },
             { user_id: 2, tweet_id: 1 },
             { user_id: 3, tweet_id: 1 }])
