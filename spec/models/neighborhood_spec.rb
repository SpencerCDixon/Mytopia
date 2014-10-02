require 'rails_helper'

describe Neighborhood do
  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }

  end

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:neighborhood_photos) }
  end
end
