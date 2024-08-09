puts "Seeding Classrooms..."
Classroom.create([
  { name: 'Class A', user_id: 1 },
  { name: 'Class B', user_id: 2 },
  { name: 'Class C', user_id: 1 },
  { name: 'Class D', user_id: 1 }
])
puts "ALL DONE - Seeded Classrooms"