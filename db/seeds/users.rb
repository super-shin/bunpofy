#Create a few new Users
puts "Seeding Users..."
puts "Seeding Teachers..."
User.create!([
  { email: 'teacher@gmail.com', password: '123456', first_name: 'Teacher', last_name: 'Admin', role: 'teacher', school: 'Tokyo Elementary School' },
  { email: 'hatakekakashi@hljhs.com', password: '123456', first_name: 'Kakashi', last_name: 'Hatake', role: 'teacher', school: 'Hidden Leaf JHS' },
  { email: 'sarutobihiruzen@minami.com', password: '123456', first_name: 'Hiruzen', last_name: 'Sarutobi', role: 'teacher', school: 'Minami International School' },
  { email: 'shingie@karasuno.com', password: '123456', first_name: 'Shingie', last_name: 'Taira', role: 'teacher', school: 'Karasuno Elementary School' }
])


puts "Seeding Class A from Tokyo Elementary School...."
User.create!([
  { email: 'student@gmail.com', password: '123456', first_name: 'Kazuto', last_name: 'Fuji', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'saitoayumi@tges.com', password: '123456', first_name: 'Ayumi', last_name: 'Saito', role: 'student', school: 'Tokyo Elementary School' },
  { email: 'takahashiharuto@tges.com', password: '123456', first_name: 'Haruto', last_name: 'Takahashi', role: 'student', school: 'Tokyo Elementary School' },
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
  
  puts "Seeding Class C from Karasuno Elementary School..."
  User.create!([
    # Male Users
    { email: 'hinatashoyo@karasuno.com', password: '123456', first_name: 'Shoyo', last_name: 'Hinata', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'kageyamabio@karasuno.com', password: '123456', first_name: 'Tobio', last_name: 'Kageyama', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'nishinoyayuu@karasuno.com', password: '123456', first_name: 'Yuu', last_name: 'Nishinoya', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'yamaguchitadashi@karasuno.com', password: '123456', first_name: 'Tadashi', last_name: 'Yamaguchi', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'tsukishimakei@karasuno.com', password: '123456', first_name: 'Kei', last_name: 'Tsukishima', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'sugawarakoushi@karasuno.com', password: '123456', first_name: 'Koushi', last_name: 'Sugawara', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'asahiazumane@karasuno.com', password: '123456', first_name: 'Azumane', last_name: 'Asahi', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'tanakaryuunosuke@karasuno.com', password: '123456', first_name: 'Ryuunosuke', last_name: 'Tanaka', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'ennoshitachikara@karasuno.com', password: '123456', first_name: 'Chikara', last_name: 'Ennoshita', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'kitashinsuke@karasuno.com', password: '123456', first_name: 'Shinsuke', last_name: 'Kita', role: 'student', school: 'Karasuno Elementary School' },
  
    # Female Users
    { email: 'kiyokoshimizu@karasuno.com', password: '123456', first_name: 'Kiyoko', last_name: 'Shimizu', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'yachihitoka@karasuno.com', password: '123456', first_name: 'Hitoka', last_name: 'Yachi', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'kurosawadaisuke@karasuno.com', password: '123456', first_name: 'Daisuke', last_name: 'Kurosawa', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'kinoshitayuu@karasuno.com', password: '123456', first_name: 'Yuu', last_name: 'Kinoshita', role: 'student', school: 'Karasuno Elementary School' },
    { email: 'kageyamasaeko@karasuno.com', password: '123456', first_name: 'Saeko', last_name: 'Kageyama', role: 'student', school: 'Karasuno Elementary School' }
  ])

puts "Seeding Class D from Minami International JHS..."
User.create!([
  { email: 'kawaguchiryo@minami.com', password: '123456', first_name: 'Ryo', last_name: 'Kawaguchi', role: 'student', school: 'Minami International School' },
  { email: 'nakanoshin@minami.com', password: '123456', first_name: 'Shin', last_name: 'Nakano', role: 'student', school: 'Minami International School' },
  { email: 'hayashikazu@minami.com', password: '123456', first_name: 'Kazu', last_name: 'Hayashi', role: 'student', school: 'Minami International School' },
  { email: 'suzukidaiki@minami.com', password: '123456', first_name: 'Daiki', last_name: 'Suzuki', role: 'student', school: 'Minami International School' },
  { email: 'okamotoshin@minami.com', password: '123456', first_name: 'Shin', last_name: 'Okamoto', role: 'student', school: 'Minami International School' },
  { email: 'tanakikai@minami.com', password: '123456', first_name: 'Kai', last_name: 'Tanaka', role: 'student', school: 'Minami International School' },
  { email: 'takeuchiyuki@minami.com', password: '123456', first_name: 'Yuki', last_name: 'Takeuchi', role: 'student', school: 'Minami International School' },
  { email: 'miyamotokosuke@minami.com', password: '123456', first_name: 'Kosuke', last_name: 'Miyamoto', role: 'student', school: 'Minami International School' },
  { email: 'yoshidakazu@minami.com', password: '123456', first_name: 'Kazu', last_name: 'Yoshida', role: 'student', school: 'Minami International School' },
  { email: 'sakamotoyuta@minami.com', password: '123456', first_name: 'Yuta', last_name: 'Sakamoto', role: 'student', school: 'Minami International School' },
  { email: 'sakamotoemi@minami.com', password: '123456', first_name: 'Emi', last_name: 'Sakamoto', role: 'student', school: 'Minami International School' },
  { email: 'okadakeiko@minami.com', password: '123456', first_name: 'Keiko', last_name: 'Okada', role: 'student', school: 'Minami International School' },
  { email: 'moriyukari@minami.com', password: '123456', first_name: 'Yukari', last_name: 'Mori', role: 'student', school: 'Minami International School' },
  { email: 'haradana@minami.com', password: '123456', first_name: 'Nana', last_name: 'Hara', role: 'student', school: 'Minami International School' },
  { email: 'shimizuhana@minami.com', password: '123456', first_name: 'Hana', last_name: 'Shimizu', role: 'student', school: 'Minami International School' },
  { email: 'uchidareiko@minami.com', password: '123456', first_name: 'Reiko', last_name: 'Uchida', role: 'student', school: 'Minami International School' },
  { email: 'takashimi@minami.com', password: '123456', first_name: 'Shimi', last_name: 'Takashi', role: 'student', school: 'Minami International School' },
  { email: 'kanemimiyu@minami.com', password: '123456', first_name: 'Miyu', last_name: 'Kanemi', role: 'student', school: 'Minami International School' },
  { email: 'nakamurayumi@minami.com', password: '123456', first_name: 'Yumi', last_name: 'Nakamura', role: 'student', school: 'Minami International School' },
  { email: 'yamaguchiriko@minami.com', password: '123456', first_name: 'Riko', last_name: 'Yamaguchi', role: 'student', school: 'Minami International School' },
  { email: 'okunomiku@minami.com', password: '123456', first_name: 'Miku', last_name: 'Okuno', role: 'student', school: 'Minami International School' }
])


#Class C Student Images - Minami ES
class_c_images = {
  'hinatashoyo@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239569/edc5eb62-4482-4c85-b5fb-997abfde093b.png',
  'kageyamabio@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239214/7d1ab9ab-4157-487e-a4c5-8cf3112c5737.png',
  'nishinoyayuu@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239370/eed7eeca-f2c9-488e-98d5-4d4db88566ca.png',
  'yamaguchitadashi@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239352/bad14b1f-6d32-404d-9361-dbabaf3a2d12.png',
  'tsukishimakei@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239425/fdf4e3bf-c54c-4376-84ce-5438312ca8cf.png',
  'sugawarakoushi@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239296/afb382da-f8bb-4ce7-a267-d3abe7ead2d7.png',
  'asahiazumane@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239167/dba479bf-e26f-4cf9-80b0-3efd6461255e.png',
  'tanakaryuunosuke@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239127/194b2bca-1569-413b-a49a-d6bb4a2af3c0.png',
  'ennoshitachikara@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239067/7064f7e7-b5ec-44eb-8088-ee46b9aec27f.png',
  'kitashinsuke@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239015/83a2c5cb-9fab-4790-a67d-b54967f410c5.png',
  'kiyokoshimizu@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724238962/1f7e6665-1add-43d2-bef9-0c5283f6e0be.png',
  'yachihitoka@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724239621/37e3900b-60c9-4e43-bcfe-b9f15e17fed8.png',
  'kurosawadaisuke@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724238919/9c7faaba-5f97-486b-bae0-bf4799bf9123.png',
  'kinoshitayuu@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724238855/034add2f-601b-41ad-86d4-0370de5d6a33.png',
  'kageyamasaeko@karasuno.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724238785/402a999b-f435-4452-9de5-11132936cdc6.png'
}

#Class D Student Images - Minami International School
class_d_images = {
  'kawaguchiryo@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/c_pad,w_100,h_100/v1724235582/4ec915e2-d3d3-4694-907a-9191ad3fa495.png',
  'nakanoshin@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724235713/e8eb8e4c-f520-47dd-b40e-c17f9b4ddc94.png',
  'hayashikazu@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236178/fd996ec1-7950-4716-bf1b-23a24e2be377.png',
  'suzukidaiki@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236318/e809d7d1-68f9-455e-9099-f69632c6a9fc.png',
  'okamotoshin@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237749/82c52426-5171-4ad1-9a9e-4178ee909855.png',
  'tanakikai@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236484/158e520d-8c51-4cdf-bd14-1f78f069f25d.png',
  'takeuchiyuki@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237432/1f9adc5c-273f-4455-bd88-fd694464be31.png',
  'miyamotokosuke@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237616/f8016c7f-b993-472b-85ac-483520ea3f69.png',
  'yoshidakazu@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237510/3af8cff2-ee77-4ada-8081-2ea309369782.png',
  'sakamotoyuta@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236859/d94a2fcc-5fd9-4a72-893c-1612909a1e9e.png',
  'sakamotoemi@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236076/66391b89-19ee-4ab0-927b-5d95fd6d1c52.png',
  'okadakeiko@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236922/71954b35-c837-4cc8-a564-e43ce366f157.png',
  'moriyukari@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724236971/8f1af864-b72c-412c-b32e-4c23df77123c.png',
  'haradana@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237034/d8c51720-d36e-412d-b435-854ec46ae7fe.png',
  'shimizuhana@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237078/1eba9a0e-dc7d-422d-973f-effba0161922.png',
  'uchidareiko@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237126/80a9d1d3-126b-40a7-aec3-9b3f628e6980.png',
  'takashimi@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237173/b374d813-5f8a-481d-8f74-58c9ea340b0b.png',
  'kanemimiyu@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237221/d2ef25c4-47d5-41b5-bd78-9a86de503c6e.png',
  'nakamurayumi@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237318/ae2e6bb9-d3d9-4334-a273-1df3c019fb20.png',
  'yamaguchiriko@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237388/0350a959-2e59-4537-91a9-c55e469b371d.png',
  'okunomiku@minami.com' => 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724237694/631dae6c-4b7f-4f82-bb1b-d1aaf610ce0f.png'
}

puts "Seeding PICTURES...."

default_male_image_url = ['https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385925/ninja6_nujnaw.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385965/ninja5_ywmqse.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724386012/ninja2_yrvhd8.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385881/ninja3_negxwb.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385827/ninja1_tdznjy.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385747/ninja4_sh50tg.png']
default_female_image_url = ['https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385658/fninja4_scqk5d.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385706/fninja3_xreuuh.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385733/fninja2_xj4lri.png', 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385737/fninja1_v6cdcx.png']
default_sensei_image_url = 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724401056/teacher_wrwgta.png'

# List of male first names
male_names = %w[Naruto Sasuke Shikamaru Neji Rock Choji Kiba Shino Itachi Tenma Zaku Kabuto Misumi Yoroi Kazuo Ryo Daiki Kosuke Hiro Kazu Tomo Taka Sora Shin Ichi Haru Shun Yuto Ki Geko Kai Yuki Yuta Shoyo Tobio Yuu Tadashi Kei Koushi Azumane Ryuunosuke Chikara Shinsuke Kazuto]

def attach_photo(user, photo_url)
  io = URI.open(photo_url)
  user.photo.attach(io: io, filename: File.basename(photo_url), content_type: "image/webp")
end

User.all.each do |user|
  if user.school == 'Karasuno Elementary School'
    if class_c_images[user.email]
      puts "Attaching SPECIFIC image to #{user.first_name}"
      attach_photo(user, class_c_images[user.email])
    elsif user.first_name.downcase == 'shingie'
      puts "Attaching SENSEI image to #{user.first_name}"
      attach_photo(user, 'https://res.cloudinary.com/ddzvfukq6/image/upload/t_100x100/v1724385579/shin_umlz5n.jpg')
    else
      puts "Attaching DEFAULT image to #{user.first_name}"
      attach_photo(user, user.first_name.in?(male_names) ? default_male_image_url.sample : default_female_image_url.sample)
    end
  elsif user.school == 'Minami International School' && user.first_name.downcase != 'hiruzen'
    if class_d_images[user.email]
      puts "Attaching SPECIFIC image to #{user.first_name}"
      attach_photo(user, class_d_images[user.email])
    else
      puts "Attaching DEFAULT image to #{user.first_name}"
      attach_photo(user, user.first_name.in?(male_names) ? default_male_image_url.sample : default_female_image_url.sample)
    end
  else
    if user[:role] == 'student'
      puts "Attaching DEFAULT student image to #{user.first_name}"
      attach_photo(user, user.first_name.in?(male_names) ? default_male_image_url.sample : default_female_image_url.sample)
    else
      puts "Attaching sensei image to #{user.first_name}"
      attach_photo(user, default_sensei_image_url)
    end
  end
  puts "Created user #{user.email} with attached photo"
end

puts "ALL DONE - Seeded USERS"