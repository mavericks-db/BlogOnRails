require 'rails_helper'

RSpec.describe 'users_path', type: :system do
  describe 'root or index page' do
    it 'shows the username of all other users' do
      visit users_path
      expect(page).to have_content('Mavericks')
      expect(page).to have_content('Lilly')
    end

    it 'shows the profile picture for each user' do
      visit users_path
      expect(page).to have_css("img[src*='#{User.first.photo}']")
      expect(page).to have_css("img[src*='#{User.last.photo}']")
    end

    it 'shows the number of posts for each user' do
      visit users_path
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 3')
    end

    it 'redirects to that user\'s profile page when clicked' do
      visit users_path
      click_link 'Mavericks'
      expect(current_path).to eq(user_path(User.first))
    end
  end
end