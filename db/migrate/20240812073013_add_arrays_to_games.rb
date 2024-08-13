class AddArraysToGames < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :correct_answer, :text, array: true, default: [], using: 'correct_answer::text[]'
    change_column :games, :question, :text, array: true, default: [], using: 'question::text[]'
    change_column :games, :student_answer, :text, array: true, default: [], using: 'student_answer::text[]'
  end
end
