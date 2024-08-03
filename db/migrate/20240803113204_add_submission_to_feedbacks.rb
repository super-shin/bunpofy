class AddSubmissionToFeedbacks < ActiveRecord::Migration[7.1]
  def change
    add_reference :feedbacks, :submission, null: false, foreign_key: true
  end
end
