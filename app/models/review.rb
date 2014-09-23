class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true
  validates :upvotes, presence: true

  belongs_to :neighborhood
  belongs_to :user
  has_many :comments
end
