class CreateWordReferences < ActiveRecord::Migration[7.1]
  def change
    create_table :word_references do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.integer :page

      t.timestamps
    end
  end
end
