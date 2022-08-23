require 'rails_helper'

RSpec.describe 'user_path', type: :system do
  describe 'user show page' do
    it 'shows the user\'s photo' do
      visit user_path(User.first)
      expect(page).to have_css("img[src*='#{User.first.photo}']")
    end

    it 'shows the user\'s username' do
      visit user_path(User.first)
      expect(page).to have_content('Mavericks')
    end

    it 'shows the user\'s bio' do
      visit user_path(User.first)
      expect(page).to have_content('Lorem ipsum dolor sit amet,')
    end

    it 'shows the user\'s number of posts' do
      visit user_path(User.first)
      expect(page).to have_content('Number of posts: 0')
    end

    it 'shows the user\'s first 3 posts' do
      visit user_path(2)
      expect(page).to have_content('Post ID#3 Hello')
      expect(page).to have_content('Post ID#2 Hello')
      expect(page).to have_content('Post ID#1 Hello')
    end

    it 'shows the user\'s button to view all posts' do
      visit user_path(2)
      expect(page).to have_button('See all posts')
    end

    it 'redirects to that user\'s post when clicked' do
      visit user_path(2)
      click_link 'Post ID#1 Hello'
      expect(page).to have_current_path(user_post_path(2, 1))
    end

    it 'redirects to the user\'s post\'s index page' do
      visit user_path(2)
      expect(page).to have_link('See all posts')
    end
  end
end
