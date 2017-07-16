require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "relationships" do
    it { should belong_to(:company) }
  end
end
