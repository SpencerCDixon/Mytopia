class Neighborhood < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  has_many :reviews

  def self.search(search)
    if search.present?
      where("name ilike :q or city ilike :q or state ilike :q", q: "%#{search}%")
    else
      self.all # Needs to be fixed when pagination is done
    end
  end
end
