require "rails_helper"

RSpec.describe Tagging do
  describe "relationships" do
    it { should belong_to :tag }
    it { should belong_to :article }
  end
end
