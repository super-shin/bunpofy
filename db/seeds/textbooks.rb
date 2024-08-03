require 'csv'
#make a file path in an array
#make sure to add empty column at the start of all csv files under UTF-8
file_names = ['New Horizon English Course 1-3.csv']
file_paths = []
file_names.each do |file_name|
  file_paths << Rails.root.join('db', 'csv', file_name)
end

WordReference.destroy_all
puts "Destroyed Word References"
Unit.destroy_all
puts "Destroyed Units"
Word.destroy_all
puts "Destroyed Words"
Textbook.destroy_all
puts "Destroyed Textbooks"

#iterate over the file path array for multiple textbooks
puts "Entering seeds..."
file_paths.each do |file_path|
  CSV.foreach(file_path, headers: true) do |row|
    #find or create the word
    word = Word.find_or_create_by!(english: row['english'], japanese: row['japanese'], phrase: row['phrase'], level: row['level'], grade: row['grade'].to_i)
    #find or create the textbook
    textbook = Textbook.find_or_create_by!(name: row['textbook'])
    #find or create the unit with the textbook
    unit_base = row['unit']
    part_name = row['part']
    unit_name = part_name.nil? ? unit_base.strip : "#{unit_base.strip} - #{part_name.strip}"
    unit = Unit.find_or_create_by!(name: unit_name, textbook: textbook)
    #create wordReference
    word_reference = WordReference.find_or_create_by!(unit: unit, word: word, page: row['page'].to_i)
    puts "#{word.english} created"
  end
  puts "End of Seeds"
end