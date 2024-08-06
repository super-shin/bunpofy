require 'csv'
#make a file path in an array
#make sure to add empty column at the start of all csv files under UTF-8
file_names = ['Blue Sky Elementary 5-6.csv','Blue Sky English Course 1.csv','Blue Sky English Course 2.csv','Blue Sky English Course 3.csv','Columbus 21 English Course 1-3.csv','Here We Go English Course 1-3.csv','Junior Sunshine 5-6.csv','Lets Try 3-4.csv','New Crown English Series 1-3.csv','New Horizon Elementary 5-6.csv','New Horizon English Course 1-3.csv','One World English Series 1-3.csv','One World Smiles Elementary 5-6.csv','Sunshine English Course 1-3.csv']
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

# Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE word_references, units, words, textbooks RESTART IDENTITY CASCADE")


#iterate over the file path array for multiple textbooks
total_rows = 378 + 781 + 786 + 548 + 2016 + 3259 + 663 + 458 + 2466 + 1363 + 2193 + 1625 + 1288 + 2430
current_index = 0


puts "Seeding Textbooks..."
file_paths.each_with_index do |file_path, index|
  puts "\rSeeding textbook: #{file_names[index]}"
  CSV.foreach(file_path, encoding: 'UTF-8', headers: true, header_converters: :symbol) do |row|
    #find or create the word
    word = Word.find_or_create_by!(english: row[:english], japanese: row[:japanese], phrase: row[:phrase], level: row[:level], grade: row[:grade].to_i)
    #add tags via taggable gem
    word.status_list.add(row[:status], parse: true) if row[:status].present?
    word.category_list.add(row[:pos], parse: true) if row[:pos].present?
    word.save
    #find or create the textbook
    textbook = Textbook.find_or_create_by!(name: row[:textbook])
    #find or create the unit with the textbook
    unit_base = row[:unit]
    part_name = row[:part]
    unit_name = part_name.nil? ? unit_base.strip : "#{unit_base.strip} - #{part_name.strip}"
    unit = Unit.find_or_create_by!(name: unit_name, textbook: textbook)
    #create wordReference
    word_reference = WordReference.find_or_create_by!(unit: unit, word: word, page: row[:page].to_i)

    # Update progress
    current_index = current_index + 1
    percentage = (current_index.to_f / total_rows * 100).round(2)
    progress = (current_index.to_f / total_rows * 100).to_i
    progress_display = "PROGRESS:" + "/" * progress
    print "\r#{progress_display} #{percentage}%"
  end
end
puts "\nALL DONE - Seeded ALL Textbooks!"
