require "rails_helper"

RSpec.describe Comment do
  describe 'relationships' do
    it { should belong_to :article }
  end
end
