class AddClassroomToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_reference :challenges, :classroom, null: false, foreign_key: true
  end
end
