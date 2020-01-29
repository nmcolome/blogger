class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

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