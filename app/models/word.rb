class Word < ApplicationRecord
  has_many :word_references
  has_many :units, through: :word_references
end
