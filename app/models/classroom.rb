class Classroom < ApplicationRecord
  has_many :challenges
  has_many :attendances
  belongs_to :user
  validates :name, :user_id, presence: true
end
