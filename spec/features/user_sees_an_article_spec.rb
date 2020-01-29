require "rails_helper"

RSpec.describe "User sees an article" do
  describe "they link from the articles index" do
    it "displays corresponding article" do
      article = Article.create!(title:"Title", body:"Body")

      visit articles_path
      click_on article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
