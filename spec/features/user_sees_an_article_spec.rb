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

  describe "they fill in a comment form" do
    it "displays the comment on the article show" do
      article = Article.create!(title:"Title", body:"Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Me"
      fill_in "comment[body]", with: "My opinion"
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("Me")
      expect(page).to have_content("My opinion")
    end
  end
end
