class Game < ApplicationRecord
  belongs_to :submission
  validates :game_type, inclusion: { in: %w[vocab spelling grammar] }
  # Creation of the game is made before score is computed
  # validates :score, presence: true, numericality: { only_integer: true }
end
