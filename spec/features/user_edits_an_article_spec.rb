require "rails_helper"

RSpec.describe "User edits an article" do
  describe "they link from article show page" do
    describe "they fill an edit form" do
      it "displays an updated article show page" do
        article = Article.create!(title: "Title", body: "Body")

        visit article_path(article)
        click_on "Edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[body]", with: "New & improved body"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("Article #{article.title} was updated.")
        expect(page).to have_content("Title")
        expect(page).to have_content("New & improved body")
      end
    end
  end
end
