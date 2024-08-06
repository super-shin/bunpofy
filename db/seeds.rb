
# require_relative 'seeds/textbooks'
# #Destroy all Attendance
Attendance.destroy_all
puts "Destroyed Attendances"
# #Destroy all Classrooms
Classroom.destroy_all
puts "Destroyed Classrooms"
# #Destroy all Users
User.destroy_all
puts "Destroyed Users"
# Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users, classrooms, attendances RESTART IDENTITY CASCADE")
puts "RESET ID Numbers"
require_relative 'seeds/users'
require_relative 'seeds/classrooms'
require_relative 'seeds/attendance'
