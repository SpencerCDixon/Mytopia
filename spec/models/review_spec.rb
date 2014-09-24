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
end
