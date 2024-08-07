# SEEDS for BUNPOFY
# RULE: Don't change the Order of anything unless checked thoroughly

#STEP 1: Seed TEXTBOOKS (deletions on file)
require_relative 'seeds/textbooks'

#STEP 2: Destroy Attendance - Classroom - User
# #Destroy all Attendance
Attendance.destroy_all
puts "Destroyed Attendances"
# #Destroy all Classrooms
Classroom.destroy_all
puts "Destroyed Classrooms"
# #Destroy all Users
User.destroy_all
puts "Destroyed Users"
# #Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users, classrooms, attendances RESTART IDENTITY CASCADE")
puts "RESET ID Numbers"

#STEP 3: SEED Users - Classrooms - Attendances
require_relative 'seeds/users'
require_relative 'seeds/classrooms'
require_relative 'seeds/attendance'
