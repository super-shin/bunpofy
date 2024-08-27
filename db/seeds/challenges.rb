require 'open-uri'

puts "Seeding Challenges..."

# Helper method to attach a photo from a URL
def attach_photo(challenge, photo_url)
  io = URI.open(photo_url)
  challenge.photo.attach(io: io, filename: File.basename(photo_url))
end

# Create Challenges
challenges = Challenge.create!([
  { user_id: 1, unit_id: 1, classroom_id: 1, title: "Introduce yourself.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 7, 22)},
  { user_id: 3, unit_id: 653, classroom_id: 3, title: "Tell me about your daily schedule.", directions: "Write a paragraph about your daily schedule. Start with a sentence that introduces your day, like \"Every day, I wake up and start my morning.\" Then, describe the main activities you do from the time you wake up until you go to bed. Be sure to include important parts of your day, such as school, meals, and any fun activities. End your paragraph with a sentence about what you like most about your daily routine.", due_date: Date.new(2024, 7, 24)},
  { user_id: 2, unit_id: 890, classroom_id: 2, title: "Introduce your best friend.", directions: "Write a paragraph introducing your best friend. Start with a sentence that tells who your best friend is, like \"My best friend is [friend's name].\" Then, describe what they are like, including their personality, hobbies, or favorite activities. Share one special or fun thing you like to do together. End your paragraph with a sentence about why you think they are a great friend.", due_date: Date.new(2024, 7, 26)},
  { user_id: 2, unit_id: 994, classroom_id: 2, title: "Give me ideas to lessen waste at schools.", directions: "Write a paragraph about ways to reduce waste at school. Start with a sentence introducing your main idea, like \"Here are some ideas to help reduce waste at our school.\" Then, describe a few practical actions or changes that can be made, such as recycling, using reusable items, or reducing paper use. Share why these ideas are important and how they can make a difference. End your paragraph with a sentence about how everyone can help with these ideas.", due_date: Date.new(2024, 7, 30)},
  { user_id: 4, unit_id: 1, classroom_id: 4, title: "Introduce yourself.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 7, 19)},
  { user_id: 4, unit_id: 1, classroom_id: 4, title: "Tell me about you.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 7, 26)},
  { user_id: 4, unit_id: 653, classroom_id: 6, title: "Tell me about your daily schedule.", directions: "Write a paragraph about your daily schedule. Start with a sentence that introduces your day, like \"Every day, I wake up and start my morning.\" Then, describe the main activities you do from the time you wake up until you go to bed. Be sure to include important parts of your day, such as school, meals, and any fun activities. End your paragraph with a sentence about what you like most about your daily routine.", due_date: Date.new(2024, 8, 2)},
  { user_id: 4, unit_id: 890, classroom_id: 5, title: "Introduce your best friend.", directions: "Write a paragraph introducing your best friend. Start with a sentence that tells who your best friend is, like \"My best friend is [friend's name].\" Then, describe what they are like, including their personality, hobbies, or favorite activities. Share one special or fun thing you like to do together. End your paragraph with a sentence about why you think they are a great friend.", due_date: Date.new(2024, 8, 9)},
  { user_id: 4, unit_id: 2, classroom_id: 4, title: "What do you want for your birthday?", directions: "Imagine it is your birthday, and you can ask for anything you want. Write a few sentences about your dream gift or celebration. Describe what it is and why it would make you really happy. Use simple words to explain how this special gift or party would be perfect for you.", due_date: Date.new(2024, 8, 16)},
  { user_id: 4, unit_id: 654, classroom_id: 6, title: "Dream Vacation.", directions: "What country would you like to go to? Write a few sentences about your dream vacation. Tell where you would go, what you would do, and why it would be fun. Use simple words to describe your perfect trip and how it would make you feel.", due_date: Date.new(2024, 8, 23)},
  { user_id: 4, unit_id: 893, classroom_id: 5, title: "Where do you live?", directions: "Tell me about your hometown. Describe where you live, what it looks like, and one thing you like about it. Use simple words to explain why your hometown is special to you and what makes it a nice place to live.", due_date: Date.new(2024, 8, 30)},
  # New seeds from here 12
  { user_id: 4, unit_id: 1, classroom_id: 7, title: "Share something about you.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 7, 15)},
  { user_id: 4, unit_id: 1, classroom_id: 7, title: "Make an introduction.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 7, 22)},
  { user_id: 4, unit_id: 653, classroom_id: 7, title: "My daily routine.", directions: "Write a paragraph about your daily schedule. Start with a sentence that introduces your day, like \"Every day, I wake up and start my morning.\" Then, describe the main activities you do from the time you wake up until you go to bed. Be sure to include important parts of your day, such as school, meals, and any fun activities. End your paragraph with a sentence about what you like most about your daily routine.", due_date: Date.new(2024, 7, 29)},
  { user_id: 4, unit_id: 890, classroom_id: 7, title: "Who is your best friend?", directions: "Write a paragraph introducing your best friend. Start with a sentence that tells who your best friend is, like \"My best friend is [friend's name].\" Then, describe what they are like, including their personality, hobbies, or favorite activities. Share one special or fun thing you like to do together. End your paragraph with a sentence about why you think they are a great friend.", due_date: Date.new(2024, 8, 5)},
  { user_id: 4, unit_id: 2, classroom_id: 7, title: "My favorite gift.", directions: "Imagine it is your birthday, and you can ask for anything you want. Write a few sentences about your dream gift or celebration. Describe what it is and why it would make you really happy. Use simple words to explain how this special gift or party would be perfect for you.", due_date: Date.new(2024, 8, 12)},
  { user_id: 4, unit_id: 654, classroom_id: 7, title: "Time to relax!", directions: "What country would you like to go to? Write a few sentences about your dream vacation. Tell where you would go, what you would do, and why it would be fun. Use simple words to describe your perfect trip and how it would make you feel.", due_date: Date.new(2024, 8, 19)},
  { user_id: 4, unit_id: 893, classroom_id: 7, title: "My hometown.", directions: "Tell me about your hometown. Describe where you live, what it looks like, and one thing you like about it. Use simple words to explain why your hometown is special to you and what makes it a nice place to live.", due_date: Date.new(2024, 8, 26)},
  { user_id: 4, unit_id: 994, classroom_id: 7, title: "Give me ideas to lessen waste at schools.", directions: "Write a paragraph about ways to reduce waste at school. Start with a sentence introducing your main idea, like \"Here are some ideas to help reduce waste at our school.\" Then, describe a few practical actions or changes that can be made, such as recycling, using reusable items, or reducing paper use. Share why these ideas are important and how they can make a difference. End your paragraph with a sentence about how everyone can help with these ideas.", due_date: Date.new(2024, 9, 2)}
])

current_date = Date.today
challenges.each do |challenge|
  timestamp_date = 
  if challenge.due_date - 7.days > current_date
    current_date - 2.days
  else
    challenge.due_date - 7.days
  end
  challenge.update!(
    created_at: timestamp_date,
    updated_at: timestamp_date
  )
end


puts "Seeding Challenge Pictures..."
# Attach photos to Challenges
challenges[0].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723653165/CHALLENGE_3_jgkptl.jpg') }
challenges[1].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654268/CHALLENGE_4_m2rlj7.jpg') }
challenges[2].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654369/CHALLENGE_5_lzgpje.jpg') }
challenges[3].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654494/CHALLENGE_6_zlkp07.jpg') }
challenges[4].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723653165/CHALLENGE_3_jgkptl.jpg') }
challenges[5].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723656408/CHALLENGE_7_p9vpdd.jpg') }
challenges[6].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654268/CHALLENGE_4_m2rlj7.jpg') }
challenges[7].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654369/CHALLENGE_5_lzgpje.jpg') }
challenges[8].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724242241/Untitled_design_rl1ag4.jpg') }
challenges[9].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724242241/Untitled_design_2_zssrhd.jpg') }
challenges[10].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724242241/Untitled_design_3_gnxn7q.jpg') }
challenges[11].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724474555/CHALLENGE_9_gcdko4.jpg') }
challenges[12].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/1_gltduz.jpg') }
challenges[13].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/3_zcjfzr.jpg') }
challenges[14].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/4_xmoy8k.jpg') }
challenges[15].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/5_ka0g80.jpg') }
challenges[16].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/6_p4qsbp.jpg') }
challenges[17].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724469195/7_cqwdw6.jpg') }
challenges[18].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654494/CHALLENGE_6_zlkp07.jpg') }


puts "ALL DONE - Seeded Challenges"
