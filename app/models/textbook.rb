class Textbook < ApplicationRecord
  has_many :units
  has_many :words, through: :units
end
