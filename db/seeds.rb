# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# Character.create(name: "Luke", movie: movies.first)

p "Seeding..."
users = User.create([{name: 'Mavericks', photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico.',
posts_counter: 0, email: 'mavericks@gmail.com', password: '123456'},
{name: 'Lilly', photo: 'https://picsum.photos/300/200', bio: 'Teacher from Poland.', posts_counter: 0,
email: 'lilly@gmail.com', password: '123456'}])

posts = Post.create([{user: users[1], title: 'Hello', text: 'This is my first post', comments_counter: 0,
likes_counter: 0},
{user: users[1], title: 'Hello', text: 'This is my second post', comments_counter: 0, likes_counter: 0},
{user: users[1], title: 'Hello', text: 'This is my long post. Hi Mavericks!
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec arcu odio. Nulla feugiat, ipsum quis facilisis
vulputate, elit metus vehicula risus, sit amet suscipit mauris sem at est. Aliquam erat volutpat. Vivamus id ligula
pretium, iaculis risus vitae, eleifend nibh. Donec bibendum pharetra eleifend. Nunc enim ligula, sodales venenatis
efficitur sit amet, hendrerit id metus. Nulla dapibus, neque mattis varius dapibus, mi purus laoreet odio, quis
venenatis elit nunc a ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;
Nullam lacinia velit arcu, non tincidunt orci sagittis sed. Pellentesque pretium lobortis leo.

Ut lacinia ipsum quis lacus sagittis bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada
fames ac turpis egestas. Morbi vel congue justo. Sed cursus fringilla metus, sollicitudin sagittis mi sagittis vel.
Phasellus magna tortor, dignissim non quam id, gravida ultrices augue. Sed pellentesque accumsan erat, non blandit diam
fringilla non. Sed eget risus posuere, ornare orci eu, feugiat sem. Aenean dignissim cursus elementum. Nulla aliquet
faucibus lacus, a congue est fermentum ut. Etiam non elementum risus, in dapibus augue. Nam eu nulla dictum, cursus
dolor at, eleifend sem. Cras sapien augue, sollicitudin in enim vitae, dictum pharetra elit. Lorem ipsum dolor sit amet,
consectetur adipiscing elit. Integer at justo luctus, pulvinar mauris vel, viverra urna. Vivamus risus libero, egestas
vehicula lectus at, elementum cursus turpis. Donec quam nibh, ultricies eu condimentum at, volutpat ac orci.',
comments_counter: 0, likes_counter: 0}])

comments = Comment.create([{post: posts.first, user: users[1], text: 'Hi Tom!'},
{post: posts.first, user: users[1],text: 'Hi Tom! Again'},
{post: posts.first, user: users[1], text: 'Hi Tom! Thrice'},
{post: posts[1], user: users[1], text: 'Hi Tom! Four times'}])

users.each do |user|
  user.posts_counter = user.posts.count
  user.save
end

posts.each do |post|
  post.comments_counter = post.comments.count
  post.likes_counter = post.likes.count
  post.save
end

p "Successfully created #{User.count} users"
p "Successfully created #{Post.count} posts"
p "Successfully created #{Comment.count} comments"
p "Seeding finished"
