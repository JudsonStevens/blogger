require 'rails_helper'

describe 'user deletes an article' do
  describe 'they click the delete link from the show page' do
    it 'deletes an article and displays all articles without the deleted one' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')

      visit article_path(article_1)
      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
    end
  end
end

