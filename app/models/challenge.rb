class Challenge < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :unit
  belongs_to :classroom
  has_many :submissions
  has_many :attendances, through: :classroom
  has_many :students, through: :attendances, source: :user
  validates :title, :directions, presence: true
end
