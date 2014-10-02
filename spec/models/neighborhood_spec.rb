require 'rails_helper'

describe Neighborhood do

  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }

  end

  describe 'associations' do
    it { should have_many(:reviews) }
  end

  describe '#calculate_rating' do
    it 'should have average rating of 10 %' do
      review = FactoryGirl.create(:review)

      expect(review.neighborhood.calculate_rating).to eql(10)
    end
  end

  describe ".search" do
    it "should find the city Newton" do
      neighborhood = FactoryGirl.create(:neighborhood)

      expect(Neighborhood.search("newton")).to include(neighborhood)
    end
  end

end
