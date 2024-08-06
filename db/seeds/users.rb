#Destroy all Users
User.destroy_all
#Create a few new Users
puts "Seeding user data..."
User.create([
  { email: 'teacher@gmail.com', password: '123456', first_name: 'Teacher', last_name: 'Admin', role: 'teacher', school: 'Hidden Leaf JHS' },
  { email: 'hatakekakashi@hljhs.com', password: '123456', first_name: 'Kakashi', last_name: 'Hatake', role: 'teacher', school: 'Hidden Leaf JHS' },
  { email: 'sarutobihiruzen@hljhs.com', password: '123456', first_name: 'Hiruzen', last_name: 'Sarutobi', role: 'teacher', school: 'Hidden Leaf JHS' },
  { email: 'uzumakinaruto@hljhs.com', password: '123456', first_name: 'Naruto', last_name: 'Uzumaki', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'uchihasasuke@hljhs.com', password: '123456', first_name: 'Sasuke', last_name: 'Uchiha', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'harunosakura@hljhs.com', password: '123456', first_name: 'Sakura', last_name: 'Haruno', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'narashikamaru@hljhs.com', password: '123456', first_name: 'Shikamaru', last_name: 'Nara', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'yamanakaino@hljhs.com', password: '123456', first_name: 'Ino', last_name: 'Yamanaka', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'hyuganeji@hljhs.com', password: '123456', first_name: 'Neji', last_name: 'Hyuga', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'leerock@hljhs.com', password: '123456', first_name: 'Rock', last_name: 'Lee', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'akimichichoji@hljhs.com', password: '123456', first_name: 'Choji', last_name: 'Akimichi', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'inuzukakiba@hljhs.com', password: '123456', first_name: 'Kiba', last_name: 'Inuzuka', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'aburameshino@hljhs.com', password: '123456', first_name: 'Shino', last_name: 'Aburame', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'hyugahinata@hljhs.com', password: '123456', first_name: 'Hinata', last_name: 'Hyuga', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'izumotenma@hljhs.com', password: '123456', first_name: 'Tenma', last_name: 'Izumo', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'uchihaitachi@hljhs.com', password: '123456', first_name: 'Itachi', last_name: 'Uchiha', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'inarishinko@hljhs.com', password: '123456', first_name: 'Shinko', last_name: 'Inari', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'abumizaku@hljhs.com', password: '123456', first_name: 'Zaku', last_name: 'Abumi', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'tsuchikin@hljhs.com', password: '123456', first_name: 'Kin', last_name: 'Tsuchi', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'yakushikabuto@hljhs.com', password: '123456', first_name: 'Kabuto', last_name: 'Yakushi', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'tsurugimisumi@hljhs.com', password: '123456', first_name: 'Misumi', last_name: 'Tsurugi', role: 'student', school: 'Hidden Leaf JHS' },
  { email: 'akadoyoroi@hljhs.com', password: '123456', first_name: 'Yoroi', last_name: 'Akado', role: 'student', school: 'Hidden Leaf JHS' },
])

puts "Seeding completed!"
# Paths to images
male_image_path = Rails.root.join("app/assets/images/male_ninja.webp")
female_image_path = Rails.root.join("app/assets/images/female_ninja.webp")
sensei_image_path = Rails.root.join("app/assets/images/sensei.webp")
# List of male first names
male_names = %w[Naruto Sasuke Shikamaru Neji Rock Choji Kiba Shino Itachi Tenma Zaku Kabuto Misumi Yoroi]
# Create users and attach photos
users = User.all
users.each do |user|
  if user[:role] == 'student'
    if male_names.include?(user.first_name)
      puts "Attaching male ninja image to #{user.first_name} #{user.last_name}"
      user.photo.attach(io: File.open(male_image_path), filename: "male_ninja.webp", content_type: "image/webp")
    else
      puts "Attaching female ninja image to #{user.first_name} #{user.last_name}"
      user.photo.attach(io: File.open(female_image_path), filename: "female_ninja.webp", content_type: "image/webp")
    end
  else
    puts "Attaching sensei image to #{user.first_name} #{user.last_name}"
    user.photo.attach(io: File.open(sensei_image_path), filename: "ninja_sensei.png", content_type: "image/png")
  end
  puts "Created user #{user.email} with attached photo"
end
puts "ALL DONE - Seeded USERS"