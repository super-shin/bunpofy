puts "Seeding Attendance..."
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