class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true
  validates :upvotes, presence: true
  validates :rating, presence: true, inclusion: { in: 1..10 }

  belongs_to :neighborhood
  belongs_to :user
  has_many :comments

  def owner?(user)
    self.user == user
  end
end
