puts "Seeding Attendance..."
#Seeding Students in 2 Classes each
puts "Seeding Class A to Classroom 1 + 4"
(5..24).each do |t|
  Attendance.create([{classroom_id: 1, user_id: t}, {classroom_id: 4, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(1).name} and #{Classroom.find(4).name}"
end
puts "Seeding Class B to Classroom 2 + 5"
(25..43).each do |t|
  Attendance.create([{classroom_id: 2, user_id: t}, {classroom_id: 5, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(2).name} and #{Classroom.find(5).name}"
end
puts "Seeding Class C to Classroom 3 + 6"
(44..58).each do |t|
  Attendance.create([{classroom_id: 3, user_id: t}, {classroom_id: 6, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(3).name} and #{Classroom.find(6).name}"
end
puts "Seeding Class D to Classroom 7"
(59..79).each do |t|
  Attendance.create([{classroom_id: 7, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(7).name}"
end
puts "ALL DONE - Seeded Attendances"
