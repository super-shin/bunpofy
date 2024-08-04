class Classroom < ApplicationRecord
  has_many :challenges
  has_many :attendances
  belongs_to :user
end
