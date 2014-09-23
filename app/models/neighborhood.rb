class Neighborhood < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  has_many :reviews
end
