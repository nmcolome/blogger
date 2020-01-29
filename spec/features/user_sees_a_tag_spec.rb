require "rails_helper"

RSpec.describe "A user sees a single tag" do
  describe "user links from article show page" do
    describe "displays a tag show page" do
      it "displays a tag's information" do
        article = Article.create!(title: "Title", body: "Article body")
        tag = Tag.create!(name: "Tag")
        article.tags << tag

        visit article_path(article)
        click_on tag.name

        expect(current_path).to eq(tag_path(tag))
        expect(page).to have_content(tag.name)
        expect(page).to have_link(article.title)
      end
    end
  end
end
