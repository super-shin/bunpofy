class ChangeDirectionsToTextInChallenges < ActiveRecord::Migration[7.1]
  def change
    change_column :challenges, :directions, :text
  end
end
