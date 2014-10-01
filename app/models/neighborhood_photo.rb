class NeighborhoodPhoto < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :user

  validates :user_id, presence: true
  validates :neighborhood_id, presence: true
end
