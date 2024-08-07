class Classroom < ApplicationRecord
  has_many :challenges
  has_many :attendances
  has_many :students, through: :attendances, source: :user
  belongs_to :user
  validates :name, :user_id, presence: true
end
