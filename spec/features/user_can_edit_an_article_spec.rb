require 'rails_helper'

describe 'user can edit an article' do
  describe 'user can click on the link from index and edit from show view' do
    it 'edits the article and returns the user to the show page with changes implemented' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')

      visit(article_path(article_1))
      click_link('Edit')
      fill_in 'article[title]', with: 'Edited title!'
      fill_in 'article[body]', with: 'Edited body!'
      click_on('Update Article')

      expect(current_path).to eq(article_path(article_1))
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content('Edited title!')
      expect(page).to have_content('Article Edited title! Updated!')
    end
  end
end
