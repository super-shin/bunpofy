puts "Seeding Classrooms..."
Classroom.create([
  { name: 'Class A', user_id: 1 },
  { name: 'Class B', user_id: 2 }
])
puts "ALL DONE - Seeded Classrooms"