class ChangeContentInFeedbacks < ActiveRecord::Migration[7.1]
  def change
    change_column :feedbacks, :content, :text
  end
end
