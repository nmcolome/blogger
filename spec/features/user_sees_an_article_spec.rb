require "rails_helper"

RSpec.describe "User sees an article" do
  describe "they link from the articles index" do
    it "displays article information" do
      article = Article.create!(title:"Title", body:"Body")
      comment1 = article.comments.create!(author_name: "Me", body: "Commenty comments")
      comment2 = article.comments.create!(author_name: "You", body: "So much to say")

      visit articles_path

      click_on article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_link("<< Back to Articles List")
      expect(page).to have_content(comment1.author_name)
      expect(page).to have_content(comment1.body)
      expect(page).to have_content(comment2.author_name)
      expect(page).to have_content(comment2.body)
    end
  end
end
