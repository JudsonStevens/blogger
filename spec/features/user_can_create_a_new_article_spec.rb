require 'rails_helper'

describe 'user can create a new article' do
  describe 'user navigates to create article' do
    it 'brings the user to an interface in order to create a new article and creates an article after the title and body are filled out' do
      visit articles_path
      click_link 'Create a New Article'

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'New Title!'
      fill_in 'article[body]', with: 'New Body!'
      click_on 'Create Article'

      expect(page).to have_content('New Title!')
      expect(page).to have_content('New Body!')
    end
  end
end