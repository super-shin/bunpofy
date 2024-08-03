class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :english
      t.string :japanese
      t.string :phrase
      t.string :level
      t.integer :grade

      t.timestamps
    end
  end
end
