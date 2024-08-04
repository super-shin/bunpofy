class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :type
      t.string :correct_answer
      t.string :question
      t.string :student_answer
      t.integer :score
      t.references :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
