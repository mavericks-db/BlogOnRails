# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding..."
users = User.create([{name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0},
{name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0}])

Post.create(user: users.first, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
Post.create(user: users.first, title: 'Hello', text: 'This is my second post', comments_counter: 0, likes_counter: 0)

p "Successfully created #{User.count} users"
p "Successfully created #{Post.count} posts"
p "Seeding finished"