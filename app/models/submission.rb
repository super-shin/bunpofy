class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :games
  has_one :feedback
end
