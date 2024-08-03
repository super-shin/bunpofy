class Unit < ApplicationRecord
  belongs_to :textbook
  has_many :wordReferences
end
