puts "Seeding 2 Challenges..."
Challenge.create([
  { user_id: 1, unit_id: 1, classroom_id: 1, title: "1 Challenge", directions: "Create any sentence with 5 words", due_date: Date.new(2024, 10, 15)},
  { user_id: 1, unit_id: 2, classroom_id: 1, title: "2 Challenge", directions: "Create any sentence with 3 words", due_date: Date.new(2024, 10, 16)},
  { user_id: 1, unit_id: 3, classroom_id: 2, title: "3 Challenge", directions: "Create any sentence with 2 words", due_date: Date.new(2024, 10, 16)},
  { user_id: 2, unit_id: 1, classroom_id: 1, title: "Different Professor Challenge", directions: "Create any sentence with 3 words", due_date: Date.new(2024, 10, 16)}
])
puts "ALL DONE - Seeded Challenges"