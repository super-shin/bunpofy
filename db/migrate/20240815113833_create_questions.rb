class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :student_answer
      t.string :correct_answer
      t.string :options, array: true, default: []
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
