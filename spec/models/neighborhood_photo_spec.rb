require 'rails_helper'
describe NeighborhoodPhoto do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:neighborhood_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:neighborhood) }
  end
end
