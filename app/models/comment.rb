class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :review_id, presence: true
  validates :user_id, presence: true

  belongs_to :review
end
