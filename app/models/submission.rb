class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :games
  has_one :feedback

  validates :content, presence: true
  validate :content_must_be_at_least_two_words

  private

  def content_must_be_at_least_two_words
    if content.present? && content.split(/\s+/).size < 2
      errors.add(:content, "must contain at least two words")
    end
  end
end
