require 'rails_helper'

RSpec.describe 'user_posts_path', type: :system do
  describe 'user post index page' do
    it 'shows the profile picture for that user' do
      visit user_posts_path(2)
      expect(page).to have_css("img[src*='#{User.last.photo}']")
    end

    it 'shows the username of all other users' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.name)
    end

    it 'shows the number of posts for each user' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.count)
    end

    it 'shows the post\'s title' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.first.title)
    end

    it 'shows the post\'s body' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.first.text)
    end

    it 'shows the first comment on a post\'s' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.first.comments.first.text)
    end

    it 'shows how many comments there are on a post' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.first.comments.count)
    end

    it 'shows how many likes there are on a post' do
      visit user_posts_path(2)
      expect(page).to have_content(User.last.posts.first.likes.count)
    end
  end
end
