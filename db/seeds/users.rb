#Create a few new Users
puts "Seeding Users..."
puts "Seeding Teachers..."
User.create!([
  { email: 'teacher@gmail.com', password: '123456', first_name: 'Teacher', last_name: 'Admin', role: 'teacher', school: 'Tokyo Elementary School' },
  { email: 'hatakekakashi@hljhs.com', password: '123456', first_name: 'Kakashi', last_name: 'Hatake', role: 'teacher', school: 'Hidden Leaf JHS' },
  { email: 'sarutobihiruzen@minami.com', password: '123456', first_name: 'Hiruzen', last_name: 'Sarutobi', role: 'teacher', school: 'Minami Elementary School' },
  { email: 'miyagiken@karasuno.com', password: '123456', first_name: 'Ken', last_name: 'Miyagi', role: 'teacher', school: 'Karasuno JHS' }
])


puts "Seeding Class A from Tokyo Elementary School...."
User.create!([
  { email: 'nishikikazuo@tges.com', password: '123456', first_name: 'Kazuo', last_name: 'Nishiki', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'saitoayumi@tges.com', password: '123456', first_name: 'Ayumi', last_name: 'Saito', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'takahashiryo@tges.com', password: '123456', first_name: 'Ryo', last_name: 'Takahashi', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'yamamotohiro@tges.com', password: '123456', first_name: 'Hiro', last_name: 'Yamamoto', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'fujimorikazu@tges.com', password: '123456', first_name: 'Kazu', last_name: 'Fujimori', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'matsumotokimi@tges.com', password: '123456', first_name: 'Kimi', last_name: 'Matsumoto', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'ishikawatomo@tges.com', password: '123456', first_name: 'Tomo', last_name: 'Ishikawa', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'nakamurakiku@tges.com', password: '123456', first_name: 'Kiku', last_name: 'Nakamura', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'ogawaakemi@tges.com', password: '123456', first_name: 'Akemi', last_name: 'Ogawa', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'takagiakio@tges.com', password: '123456', first_name: 'Akio', last_name: 'Takagi', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'koyamataka@tges.com', password: '123456', first_name: 'Taka', last_name: 'Koyama', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'kanekisora@tges.com', password: '123456', first_name: 'Sora', last_name: 'Kaneki', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'shimizushin@tges.com', password: '123456', first_name: 'Shin', last_name: 'Shimizu', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'kawashimayumi@tges.com', password: '123456', first_name: 'Yumi', last_name: 'Kawashima', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'ikedaichi@tges.com', password: '123456', first_name: 'Ichi', last_name: 'Ikeda', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'uchidaharu@tges.com', password: '123456', first_name: 'Haru', last_name: 'Uchida', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'okamotoemi@tges.com', password: '123456', first_name: 'Emi', last_name: 'Okamoto', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'yoshidashun@tges.com', password: '123456', first_name: 'Shun', last_name: 'Yoshida', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'sugimoriyuto@tges.com', password: '123456', first_name: 'Yuto', last_name: 'Sugimori', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'miyazakiki@tges.com', password: '123456', first_name: 'Ki', last_name: 'Miyazaki', role: 'student', school: 'Tokyo Elementary School' }
  ])

puts "Seeding Class B from Hidden Leaf JHS..."
User.create!([ 
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
  { email: 'akadoyoroi@hljhs.com', password: '123456', first_name: 'Yoroi', last_name: 'Akado', role: 'student', school: 'Hidden Leaf JHS' }
])

puts "Seeding Class C from Minami Elementary School..."
User.create!([
  { email: 'kawaguchiryo@minami.com', password: '123456', first_name: 'Ryo', last_name: 'Kawaguchi', role: 'student', school: 'Minami Elementary School' },
  { email: 'nakanoshin@minami.com', password: '123456', first_name: 'Shin', last_name: 'Nakano', role: 'student', school: 'Minami Elementary School' },
  { email: 'hayashikazu@minami.com', password: '123456', first_name: 'Kazu', last_name: 'Hayashi', role: 'student', school: 'Minami Elementary School' },
  { email: 'suzukiryo@minami.com', password: '123456', first_name: 'Ryo', last_name: 'Suzuki', role: 'student', school: 'Minami Elementary School' },
  { email: 'okamotoshin@minami.com', password: '123456', first_name: 'Shin', last_name: 'Okamoto', role: 'student', school: 'Minami Elementary School' },
  { email: 'tanakikai@minami.com', password: '123456', first_name: 'Kai', last_name: 'Tanaka', role: 'student', school: 'Minami Elementary School' },
  { email: 'takeuchiyuki@minami.com', password: '123456', first_name: 'Yuki', last_name: 'Takeuchi', role: 'student', school: 'Minami Elementary School' },
  { email: 'miyamotoryo@minami.com', password: '123456', first_name: 'Ryo', last_name: 'Miyamoto', role: 'student', school: 'Minami Elementary School' },
  { email: 'yoshidakazu@minami.com', password: '123456', first_name: 'Kazu', last_name: 'Yoshida', role: 'student', school: 'Minami Elementary School' },
  { email: 'sakamotoyuta@minami.com', password: '123456', first_name: 'Yuta', last_name: 'Sakamoto', role: 'student', school: 'Minami Elementary School' },
  { email: 'sakamotoemi@minami.com', password: '123456', first_name: 'Emi', last_name: 'Sakamoto', role: 'student', school: 'Minami Elementary School' },
  { email: 'okadakeiko@minami.com', password: '123456', first_name: 'Keiko', last_name: 'Okada', role: 'student', school: 'Minami Elementary School' },
  { email: 'moriyukari@minami.com', password: '123456', first_name: 'Yukari', last_name: 'Mori', role: 'student', school: 'Minami Elementary School' },
  { email: 'haradana@minami.com', password: '123456', first_name: 'Nana', last_name: 'Hara', role: 'student', school: 'Minami Elementary School' },
  { email: 'shimizuhana@minami.com', password: '123456', first_name: 'Hana', last_name: 'Shimizu', role: 'student', school: 'Minami Elementary School' },
  { email: 'uchidareiko@minami.com', password: '123456', first_name: 'Reiko', last_name: 'Uchida', role: 'student', school: 'Minami Elementary School' },
  { email: 'takashimi@minami.com', password: '123456', first_name: 'Shimi', last_name: 'Takashi', role: 'student', school: 'Minami Elementary School' },
  { email: 'kanemimiyu@minami.com', password: '123456', first_name: 'Miyu', last_name: 'Kanemi', role: 'student', school: 'Minami Elementary School' },
  { email: 'nakamurayumi@minami.com', password: '123456', first_name: 'Yumi', last_name: 'Nakamura', role: 'student', school: 'Minami Elementary School' },
  { email: 'yamaguchiriko@minami.com', password: '123456', first_name: 'Riko', last_name: 'Yamaguchi', role: 'student', school: 'Minami Elementary School' },
  { email: 'okunomiku@minami.com', password: '123456', first_name: 'Miku', last_name: 'Okuno', role: 'student', school: 'Minami Elementary School' }
])


puts "Seeding Class D from Karasuno JHS..."
User.create!([
  # Male Users
  { email: 'hinatashoyo@karasuno.com', password: '123456', first_name: 'Shoyo', last_name: 'Hinata', role: 'student', school: 'Karasuno JHS' },
  { email: 'kageyamabio@karasuno.com', password: '123456', first_name: 'Tobio', last_name: 'Kageyama', role: 'student', school: 'Karasuno JHS' },
  { email: 'nishinoyayuu@karasuno.com', password: '123456', first_name: 'Yuu', last_name: 'Nishinoya', role: 'student', school: 'Karasuno JHS' },
  { email: 'yamaguchitadashi@karasuno.com', password: '123456', first_name: 'Tadashi', last_name: 'Yamaguchi', role: 'student', school: 'Karasuno JHS' },
  { email: 'tsukishimakei@karasuno.com', password: '123456', first_name: 'Kei', last_name: 'Tsukishima', role: 'student', school: 'Karasuno JHS' },
  { email: 'sugawarakoushi@karasuno.com', password: '123456', first_name: 'Koushi', last_name: 'Sugawara', role: 'student', school: 'Karasuno JHS' },
  { email: 'asahiazumane@karasuno.com', password: '123456', first_name: 'Azumane', last_name: 'Asahi', role: 'student', school: 'Karasuno JHS' },
  { email: 'tanakaryuunosuke@karasuno.com', password: '123456', first_name: 'Ryuunosuke', last_name: 'Tanaka', role: 'student', school: 'Karasuno JHS' },
  { email: 'ennoshitachikara@karasuno.com', password: '123456', first_name: 'Chikara', last_name: 'Ennoshita', role: 'student', school: 'Karasuno JHS' },
  { email: 'kitashinsuke@karasuno.com', password: '123456', first_name: 'Shinsuke', last_name: 'Kita', role: 'student', school: 'Karasuno JHS' },

  # Female Users
  { email: 'kiyokoshimizu@karasuno.com', password: '123456', first_name: 'Kiyoko', last_name: 'Shimizu', role: 'student', school: 'Karasuno JHS' },
  { email: 'yachihitoka@karasuno.com', password: '123456', first_name: 'Hitoka', last_name: 'Yachi', role: 'student', school: 'Karasuno JHS' },
  { email: 'kurosawadaisuke@karasuno.com', password: '123456', first_name: 'Daisuke', last_name: 'Kurosawa', role: 'student', school: 'Karasuno JHS' },
  { email: 'kinoshitayuu@karasuno.com', password: '123456', first_name: 'Yuu', last_name: 'Kinoshita', role: 'student', school: 'Karasuno JHS' },
  { email: 'kageyamasaeko@karasuno.com', password: '123456', first_name: 'Saeko', last_name: 'Kageyama', role: 'student', school: 'Karasuno JHS' }
])


puts "Seeding PICTURES...."
# Remote image URLs
male_image_url = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723555359/development/afl0gfvruu22fe3jgajtknke2kk5.webp'
female_image_url = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723555982/development/7f93bfp053d2mgsmdvwov3nr4r6l.webp'
sensei_image_url = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723657074/development/3lv82qrofset16ziav2dkem0t2vf.webp'

# List of male first names
male_names = %w[Naruto Sasuke Shikamaru Neji Rock Choji Kiba Shino Itachi Tenma Zaku Kabuto Misumi Yoroi Kazuo Ryo Hiro Kazu Tomo Taka Sora Shin Ichi Haru Shun Yuto Ki Geko Kai Yuki Yuta Shoyo Tobio Yuu Tadashi Kei Koushi Azumane Ryuunosuke Chikara Shinsuke]

# Helper method to attach a photo from a URL
def attach_photo(user, photo_url)
  io = URI.open(photo_url)
  user.photo.attach(io: io, filename: File.basename(photo_url), content_type: "image/webp")
end

# Create users and attach photos
User.all.each do |user|
  if user[:role] == 'student'
    if male_names.include?(user.first_name)
      puts "Attaching male ninja image to #{user.first_name} #{user.last_name}"
      attach_photo(user, male_image_url)
    else
      puts "Attaching female ninja image to #{user.first_name} #{user.last_name}"
      attach_photo(user, female_image_url)
    end
  else
    puts "Attaching sensei image to #{user.first_name} #{user.last_name}"
    attach_photo(user, sensei_image_url)
  end
  puts "Created user #{user.email} with attached photo"
end

puts "ALL DONE - Seeded USERS"