require 'rails_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:neighborhood_id) }
    it { should validate_presence_of(:upvotes) }

  end

  describe 'associations' do
    it { should belong_to(:neighborhood) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe '#owner?' do
    it 'should return true if user is owner' do
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user)

      expect(review.owner?(user)).to eql(true)
    end

    it 'should return false if user is not owner' do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user)

      expect(review.owner?(user2)).to eql(false)
    end
  end
end
