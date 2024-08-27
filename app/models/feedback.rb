class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :submission
  has_many :notifications, as: :notifiable
  validates :content, presence: true
end
