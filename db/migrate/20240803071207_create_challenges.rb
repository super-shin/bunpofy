class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :directions
      t.date :due_date

      t.timestamps
    end
  end
end
