puts "Seeding Attendance..."
#Seeding 15 Students in 1 Class
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
(44..64).each do |t|
  Attendance.create([{classroom_id: 3, user_id: t}, {classroom_id: 6, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(3).name} and #{Classroom.find(6).name}"
end
puts "Seeding Class D to Classroom 7"
(65..79).each do |t|
  Attendance.create([{classroom_id: 7, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.find(7).name}"
end
#Seeding 15 Students in A Class
(4..17).each do |t|
  Attendance.create([{classroom_id: 1, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.first.name}"
end
#Seending 5 Students in C Class
(18..22).each do |t|
  Attendance.create([{classroom_id: 3, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.first.name}"
end
#Seeding 5 Students in D Class
(23..32).each do |t|
  Attendance.create([{classroom_id: 4, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.first.name}"
end

puts "ALL DONE - Seeded Attendances"
