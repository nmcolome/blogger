require "rails_helper"

RSpec.describe "User sees all tags" do
  describe "they visit /tags" do
    it "displays a list of all tags" do
      tag1 = Tag.create!(name: "Name1")
      tag2 = Tag.create!(name: "Name2")

      visit tags_path

      expect(page).to have_link(tag1.name)
      expect(page).to have_link(tag2.name)
    end
  end
end
