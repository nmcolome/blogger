class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title, :body

  def tag_list
    tags.pluck(:name).join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(", ").map(&:downcase).uniq
    names = tag_names.map { |tag_name| Tag.find_or_create_by(name: tag_name) }
    self.tags = names
  end
end