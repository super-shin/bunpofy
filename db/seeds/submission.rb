puts "Seeding Submissions for Challenge 9..."
challenge_9 = Challenge.find(9)

generic_ai_response = `{
  "corrected_text" => "This is a default AI response.",
  "clarity" => "50",
  "alternatives" => [
    "This is a default alternative response."
  ],
  "info" => {
    "score" => "95",
    "chars_count" => 30,
    "word_count" => 6,
    "sentence_count" => 1
  },
  "errors" => []
}`

submissions = [
  { user_id: 60, content: "We should start by recycling paper and plastic, and using reusable water bottles. This will help keep our school clean and save resources. Everyone can do their part by following these rules.", score: 85 },
  { user_id: 61, content: "We can use both sides of the paper before recycling it, and bring our own lunch boxes instead of using disposable ones. These actions will cut down on trash and protect the environment. We all need to remember to follow these practices.", score: 90 },
  { user_id: 62, content: "We should use digital notes instead of printing everything, and avoid using single-use plastics. These changes will reduce the amount of waste and make our school more eco-friendly. Everyone can help by making these small changes.", score: 80 },
  { user_id: 63, content: "We can recycle all paper, plastic, and glass items, and use reusable containers for our snacks. This helps cut down on the amount of garbage we produce and keeps our school cleaner. Everyone can support this by recycling and reusing items.", score: 87 },
  { user_id: 64, content: "Bringing reusable bags for books and lunches and using less paper by doing digital homework are great ways to start. These habits help us save resources and make less trash. Everyone should try to adopt these habits.", score: 92 },
  { user_id: 65, content: "We should encourage everyone to use both sides of paper before recycling it and to avoid single-use items. These steps will help us minimize waste and protect the environment. Everyone can make a difference by following these guidelines.", score: 88 },
  { user_id: 66, content: "We can use reusable water bottles and bring our lunch in reusable containers. This reduces the amount of trash and is better for our planet. Everyone should participate in these simple practices.", score: 95 },
  { user_id: 67, content: "Start by using less paper by writing notes on tablets and recycling old papers. This helps reduce waste and keeps our environment clean. Everyone can help by being mindful of their paper use.", score: 83 },
  { user_id: 68, content: "We can recycle more and use less plastic by switching to reusable bags and bottles. This will cut down on the waste we produce and keep our school environment nicer. Everyone should be careful to follow these practices.", score: 65 },
  { user_id: 69, content: "We should make sure to use reusable items and recycle whenever possible. This helps decrease the amount of garbage and is good for the environment. Everyone can contribute by making these small changes.", score: 82 },
  { user_id: 70, content: "We can use both sides of paper and switch to digital notes. These changes help lessen the amount of waste and conserve resources. Everyone should try to follow these tips.", score: 75 },
  { user_id: 71, content: "Recycle as much as possible and avoid using disposable items like plastic cutlery. This will help us produce less trash and be more environmentally friendly. Everyone should participate to make a difference.", score: 65 },
  { user_id: 72, content: "Using reusable bags and bottles, and recycling paper can make a big difference. These steps help reduce the amount of waste and protect our environment. Everyone can help by adopting these habits.", score: 99 },
  { user_id: 73, content: "We should use digital formats for notes and homework and recycle paper and plastic. This will cut down on the waste we generate and help keep our school clean. Everyone should follow these ideas.", score: 73 },
  { user_id: 74, content: "Bring reusable containers and avoid using single-use plastics. This reduces waste and is better for our environment. Everyone should help by making these simple changes.", score: 80 },
  { user_id: 75, content: "Using both sides of the paper and recycling old materials can cut down on waste. These practices help save resources and keep our environment clean. Everyone should try to follow these tips.", score: 87 },
  { user_id: 76, content: "Use reusable items like water bottles and lunch boxes, and recycle as much as you can. This will help decrease the amount of garbage and protect our planet. Everyone can make a difference by adopting these habits.", score: 88 },
  { user_id: 77, content: "Start by recycling paper, plastics, and using reusable containers. This helps to reduce the amount of waste and benefits the environment. Everyone can support this effort by following these guidelines.", score: 73 },
  { user_id: 78, content: "We can use digital devices for notes instead of paper and make sure to recycle everything we can. These actions help reduce our waste and keep our school environment cleaner. Everyone should try to follow these tips.", score: 86 },
  { user_id: 79, content: "Bring your own reusable bottles and bags and recycle paper and plastic. This will help reduce the amount of waste we produce and is good for the environment. Everyone can make a difference by following these ideas.", score: 86 },
    # Kawaguchi Ryo's Challenge Submission below
  { user_id: 59, content: "We can recycle paper and plastic, reuse water bottles, and print less. These ideas help save the environment, and everyone can contribute by doing these things.", score: 60,
    ai_response: `{
      "corrected_text" => "We can recycle paper and plastic, reuse water bottles, and print less. These ideas help save the environment, and everyone can contribute by doing these things.",
      "clarity" => "60",
      "alternatives" => [
        "By recycling paper and plastic, reusing water bottles, and printing less, we can help save the environment. Everyone can contribute by adopting these practices.",
        "Recycling paper and plastic, reusing water bottles, and printing less are simple actions that can help protect the environment. Everyone can contribute to these efforts."
      ],
      "info" => {
        "score" => "60",
        "chars_count" => 206,
        "word_count" => 27,
        "sentence_count" => 2
      },
      "errors" => [
        {"type" => "Grammar", "description" => "The subject 'ideas' is plural, so the verb should be 'help' instead of 'helps'.", "problematic_segment" => "This ideas help", "suggested_alternative" => "These ideas help"},
        {"type" => "Spelling", "description" => "The word 'reuse' is repeated unnecessarily. It should be 'reuse water bottles'.", "problematic_segment" => "use reuse water bottle", "suggested_alternative" => "reuse water bottles"},
        {"type" => "Grammar", "description" => "The pronoun 'This' does not agree with the plural noun 'ideas'.", "problematic_segment" => "This ideas", "suggested_alternative" => "These ideas"},
        {"type" => "Spelling", "description" => "The word 'everybody' should be 'everyone'.", "problematic_segment" => "everybody", "suggested_alternative" => "everyone"},
        {"type" => "Grammar", "description" => "The verb 'do' should be in the gerund form 'doing' to match the preposition 'by'.", "problematic_segment" => "by do", "suggested_alternative" => "by doing"},
        {"type" => "Style", "description" => "The phrase 'help by doing' is redundant. Consider using a more concise phrase like 'contribute by doing'.", "problematic_segment" => "help by do", "suggested_alternative" => "contribute by doing"}
      ]
    }`
  }
]

submissions.each do |submission|
  Submission.create({
    user_id: submission[:user_id],
    challenge_id: challenge_9.id,
    content: submission[:content],
    score: submission[:score],
    ai_response: submission[:ai_response] || generic_ai_response
    })
  puts "Seeded User #{submission[:user_id]}'s Submission"
end

puts "ALL DONE - Seeded Custom Submissions for Challenge 9"

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

generic_contents = [
  "Hi! I like Soccer and Volleyball. My favorite color is black.",
  "Hello. I enjoy basketball and badminton. My birthday is in August.",
  "I love tennis and swimming. My favorite food is ramen.",
  "Hi! I like badminton, basketball, and tennis. I live in Japan.",
  "Hi. I enjoy swimming and playing with my dog. My favorite subject is English.",
  "Hello, hi! I like basketball. My favorite place is our home. I am 12 years old.",
  "I like ice cream and tennis. I have a pet dog named Pochi.",
  "Hi! I enjoy tennis with my friends. My favorite season is summer.",
  "Hello. I like ice cream and basketball. I want to be a teacher when I grow up.",
  "Hi! I love badminton. My favorite fruit is apple. I live in Saitama."
]

puts "Seeding the rest of Submissions from ALL Challenges..."

Challenge.where.not(id: 9).each do |challenge|
  challenge.students.each do |student|
    content = generic_contents.sample
    Submission.create({
      user_id: student.id,
      challenge_id: challenge.id,
      content: content,
      score: rand(50..100)
    })
  end
  puts "Seeded Challenge ##{challenge.id}"
end

puts "ALL DONE - Seeded Submissions"