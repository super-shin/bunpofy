class RemoveColumnsFromGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :correct_answer, :text
    remove_column :games, :question, :text
    remove_column :games, :student_answer, :text
  end
end
