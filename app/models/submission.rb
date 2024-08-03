class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :games
  has_many :feedbacks
end
