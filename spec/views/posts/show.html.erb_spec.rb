require 'rails_helper'
RSpec.describe 'user_post_path', type: :system do
 describe 'post show page' do
  it 'shows the post\'s title' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.posts.first.title)
  end
  it 'shows who wrote the post' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.name)
  end
  it 'shows how many comments there are on a post' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.posts.first.comments.count)
  end
  it 'shows the post\'s body' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.posts.first.text)
  end
  it 'shows the username of the comment\'s author' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.posts.first.comments.first.user.name)
  end
  it 'shows the comment each commentor wrote' do
   visit user_post_path(2, 1)
   expect(page).to have_content(User.last.posts.first.comments.first.text)
  end
 end
end