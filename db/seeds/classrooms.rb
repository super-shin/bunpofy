puts "Seeding Classrooms..."
Classroom.create([
  { name: 'ES 5-1', user_id: 1 },
  { name: 'ES 6-1', user_id: 1 },
  { name: 'JHS 1-1', user_id: 1 },
  { name: 'JHS 2-1', user_id: 1 },
  { name: 'ES 5-2', user_id: 2 },
  { name: 'ES 6-2', user_id: 2 },
  { name: 'JHS 1-2', user_id: 2 },
  { name: 'JHS 2-2', user_id: 2 },
  { name: 'ES 5-3', user_id: 3 },
  { name: 'ES 6-3', user_id: 3 },
  { name: 'JHS 1-3', user_id: 3 },
  { name: 'JHS 2-3', user_id: 3 },
  { name: 'ES 5-1', user_id: 4 },
  { name: 'ES 6-1', user_id: 4 },
  { name: 'JHS 1-1', user_id: 4 },
  { name: 'JHS 2-1', user_id: 4 }
])
puts "ALL DONE - Seeded Classrooms"