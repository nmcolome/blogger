require 'rails_helper'

RSpec.describe Article do
  describe 'relatioships' do
    it { should have_many :comments }
    it { should have_many :taggings }
    it { should have_many(:tags).through(:taggings) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end
