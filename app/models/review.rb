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
  has_many :votes

  def owner?(user)
    self.user == user
  end

  def upvoted?(user)
    if user.nil?
      false
    else
      votes.where(user_id: user.id, score: 1).count >= 1
    end
  end

  def calculate_upvotes(review)
    Vote.where(review_id: review.id).sum(:score)
  end

end
