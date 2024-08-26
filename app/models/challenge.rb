class Challenge < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :unit
  belongs_to :classroom
  has_many :submissions
  has_many :attendances, through: :classroom
  has_many :students, through: :attendances, source: :user
  has_many :notifications, as: :notifiable
  validates :title, :directions, presence: true

  def photo_url
    if photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(photo, only_path: true)
    else
      'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723567292/CHALLENGE_2_ytlzm2.jpg'
    end
  end
end
