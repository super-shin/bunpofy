class Unit < ApplicationRecord
  belongs_to :textbook
  has_many :word_references
  has_many :words, through: :word_references
end
