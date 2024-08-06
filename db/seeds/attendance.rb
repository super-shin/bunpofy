puts "Seeding Attendance..."
(3..17).each do |t|
  Attendance.create([{classroom_id: 1, user_id: t}])
  puts "Enrolled #{User.find(t).first_name} to #{Classroom.first.name}"
end
puts "ALL DONE - Seeded Attendances"