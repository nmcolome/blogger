require "rails_helper"

RSpec.describe "User creates new article" do
  describe "they link from articles index" do
    describe "they fill in a title & body" do
      it "creates a new article" do
        visit articles_path
        click_on "Create a New Article"

        fill_in "article[title]", with: "New test title"
        fill_in "article[body]", with: "New test body"
        fill_in "article[tag_list]", with: "ruby, technology"
        click_on "Create Article"

        expect(page).to have_content("Article New test title was created.")
        expect(page).to have_content("New test title")
        expect(page).to have_content("Tags")
        expect(page).to have_content("ruby")
        expect(page).to have_content("technology")
        expect(page).to have_content("New test body")
      end
    end
  end
end