class Word < ApplicationRecord
  has_many :word_references
  has_many :units, through: :word_references
  acts_as_taggable_on :status, :category
  #status_list, category_list
  #.add('tag')
  #.remove('tag')
  #instance.save
end
