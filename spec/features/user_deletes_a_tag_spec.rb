require "rails_helper"

RSpec.describe "User deletes a tag" do
  describe "link from tag show page" do
    it "displays all remaining tags" do
      tag1 = Tag.create!(name: "Name1")
      tag2 = Tag.create!(name: "Name2")

      visit tag_path(tag1)

      click_on "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to have_link(tag2.name)
      expect(page).to_not have_content(tag1.name)
    end
  end
end
