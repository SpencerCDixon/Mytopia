class Vote < ActiveRecord::Base
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :score, presence: true, inclusion: { in: -1..1 }

  belongs_to :user
  belongs_to :review

  # validates_uniquness_of :review_id, scope: :user_id
end
