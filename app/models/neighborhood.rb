class Neighborhood < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  has_many :reviews

  mount_uploader :photo, NeighborhoodPhotoUploader

  def self.search(search)
    if search.present?
      where("name ilike :q or city ilike :q or state ilike :q", q: "%#{search}%")
    else
      self.all # Needs to be fixed when pagination is done
    end
  end

  def calculate_rating
    if Review.where(neighborhood_id: self.id).count > 0
      Review.where(neighborhood_id: id).sum(:rating) * 10 / Review.where(neighborhood_id: id).count
    else
      0
    end
  end
end
