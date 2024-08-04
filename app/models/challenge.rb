class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :classroom
  has_many :submissions
end
