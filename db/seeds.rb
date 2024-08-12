# SEEDS for BUNPOFY
# RULE: Don't change the Order of anything unless checked thoroughly

#STEP 1: Destroy ALL
#Attendance.destroy_all
Attendance.destroy_all
puts "Destroyed Attendances"
#Destroy all Games
Game.destroy_all
puts "Destroyed Games"
# #Destroy all Submissions
Submission.destroy_all
puts "Destroyed Submissions"
# #Destroy all Classrooms
Challenge.destroy_all
puts "Destroyed Challenges"
# #Destroy all Classrooms
Classroom.destroy_all
puts "Destroyed Classrooms"
WordReference.destroy_all
puts "Destroyed Word References"
Unit.destroy_all
puts "Destroyed Units"
Word.destroy_all
puts "Destroyed Words"
Textbook.destroy_all
puts "Destroyed Textbooks"
# #Destroy all Users
User.destroy_all
puts "Destroyed Users"
# #Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE units, words, textbooks, users, classrooms, attendances RESTART IDENTITY CASCADE")
puts "RESET ID Numbers"

#STEP 2: SEED Textbooks
require_relative 'seeds/textbooks'


#STEP 3: SEED Users - Classrooms - Attendances
require_relative 'seeds/users'
require_relative 'seeds/classrooms'
require_relative 'seeds/attendance'
require_relative 'seeds/challenges.rb'
require_relative 'seeds/submission.rb'
require_relative 'seeds/games.rb'
