puts "Seeding Classrooms..."
Classroom.create([
  { name: 'ES 5-1', user_id: 1 }, #Class A - Tokyo ES
  { name: 'JHS 1-1', user_id: 2 }, #Class B - Hidden Leaf JHS
  { name: 'ES 6-1', user_id: 3 }, #Class C - Karasuno ES
  { name: 'ES 5-1', user_id: 4 }, #Class A - Tokyo ES
  { name: 'JHS 1-1', user_id: 4 }, #Class B - Hidden Leaf JHS
  { name: 'ES 6-1', user_id: 4 }, #Class C -Karasuno ES
  { name: 'IC 3-1', user_id: 4 } #Class D - Intl School
])
puts "ALL DONE - Seeded Classrooms"