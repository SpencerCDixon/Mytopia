class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :username, presence: true, uniqueness: true

  has_many :reviews
  has_many :comments
  has_many :votes

  def admin?
    admin == true
  end
end
