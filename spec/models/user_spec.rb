require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:comments) }
  end
end
