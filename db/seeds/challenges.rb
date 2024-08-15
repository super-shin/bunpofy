require 'open-uri'

puts "Seeding Challenges..."

# Helper method to attach a photo from a URL
def attach_photo(challenge, photo_url)
  io = URI.open(photo_url)
  challenge.photo.attach(io: io, filename: File.basename(photo_url))
end

# Create Challenges first
challenges = Challenge.create!([
  { user_id: 1, unit_id: 1, classroom_id: 1, title: "Introduce yourself.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 9, 4)},
  { user_id: 1, unit_id: 681, classroom_id: 1, title: "Tell me about your daily schedule.", directions: "Write a paragraph about your daily schedule. Start with a sentence that introduces your day, like \"Every day, I wake up and start my morning.\" Then, describe the main activities you do from the time you wake up until you go to bed. Be sure to include important parts of your day, such as school, meals, and any fun activities. End your paragraph with a sentence about what you like most about your daily routine.", due_date: Date.new(2024, 9, 6)},
  { user_id: 1, unit_id: 931, classroom_id: 1, title: "Introduce your best friend.", directions: "Write a paragraph introducing your best friend. Start with a sentence that tells who your best friend is, like \"My best friend is [friend’s name].\" Then, describe what they are like, including their personality, hobbies, or favorite activities. Share one special or fun thing you like to do together. End your paragraph with a sentence about why you think they are a great friend.", due_date: Date.new(2024, 8, 15)},
  { user_id: 1, unit_id: 1057, classroom_id: 1, title: "Give me ideas to lessen waste at schools.", directions: "Write a paragraph about ways to reduce waste at school. Start with a sentence introducing your main idea, like \"Here are some ideas to help reduce waste at our school.\" Then, describe a few practical actions or changes that can be made, such as recycling, using reusable items, or reducing paper use. Share why these ideas are important and how they can make a difference. End your paragraph with a sentence about how everyone can help with these ideas.", due_date: Date.new(2024, 8, 31)},
  { user_id: 4, unit_id: 1, classroom_id: 4, title: "Introduce yourself.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 9, 4)},
  { user_id: 4, unit_id: 1, classroom_id: 4, title: "Tell me about you.", directions: "Topic Sentence: I'm [name]. N-A-M-E.\r\n\r\nDirections:\r\nWrite a paragraph introducing yourself. Start with the topic sentence: \"I'm [name]. N-A-M-E.\" Then, tell us a little about yourself. You might include your favorite hobbies, what you like to do at school, or something special about you. Finish your paragraph with a fun fact or something you enjoy.\r\n\r\nExample:\r\n\"I'm Sara. S-A-R-A. I love reading books and drawing pictures. At school, my favorite subject is art because I enjoy being creative. I also have a pet cat named Whiskers who loves to play with my yarn.\"", due_date: Date.new(2024, 9, 14)},
  { user_id: 4, unit_id: 681, classroom_id: 5, title: "Tell me about your daily schedule.", directions: "Write a paragraph about your daily schedule. Start with a sentence that introduces your day, like \"Every day, I wake up and start my morning.\" Then, describe the main activities you do from the time you wake up until you go to bed. Be sure to include important parts of your day, such as school, meals, and any fun activities. End your paragraph with a sentence about what you like most about your daily routine.", due_date: Date.new(2024, 9, 6)},
  { user_id: 4, unit_id: 931, classroom_id: 6, title: "Introduce your best friend.", directions: "Write a paragraph introducing your best friend. Start with a sentence that tells who your best friend is, like \"My best friend is [friend’s name].\" Then, describe what they are like, including their personality, hobbies, or favorite activities. Share one special or fun thing you like to do together. End your paragraph with a sentence about why you think they are a great friend.", due_date: Date.new(2024, 8, 15)},
  { user_id: 4, unit_id: 1057, classroom_id: 7, title: "Give me ideas to lessen waste at schools.", directions: "Write a paragraph about ways to reduce waste at school. Start with a sentence introducing your main idea, like \"Here are some ideas to help reduce waste at our school.\" Then, describe a few practical actions or changes that can be made, such as recycling, using reusable items, or reducing paper use. Share why these ideas are important and how they can make a difference. End your paragraph with a sentence about how everyone can help with these ideas.", due_date: Date.new(2024, 8, 31)}
])

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
challenges[8].tap { |c| attach_photo(c, 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723654494/CHALLENGE_6_zlkp07.jpg') }

puts "ALL DONE - Seeded Challenges"
