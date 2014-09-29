class Neighborhood < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  has_many :reviews

  def self.search(search)
    if search
      where("name like ?", "%#{search}%")
    end
  end
end
