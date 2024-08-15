# SEEDS for BUNPOFY
# RULE: Don't change the Order of anything unless checked thoroughly

#STEP 1: Destroy ALL
#Destroy all Games
Game.destroy_all
puts "Destroyed Games"
#Attendance.destroy_all
Attendance.destroy_all
puts "Destroyed Attendances"
#Destroy all Feedbacks
Feedback.destroy_all
puts "Destroyed Feedbacks"
# #Destroy all Submissions
Submission.destroy_all
puts "Destroyed Submissions"
# #Destroy all Challenges
Challenge.destroy_all
puts "Destroyed Challenges"
# #Destroy all Classrooms
Classroom.destroy_all
puts "Destroyed Classrooms"
# #Destroy all WordReferences
# WordReference.destroy_all
# puts "Destroyed Word References"
# # #Destroy all Units
# Unit.destroy_all
# puts "Destroyed Units"
# # #Destroy all Words
# Word.destroy_all
# puts "Destroyed Words"
# #Destroy all Textbooks  ###### 
# Textbook.destroy_all
# puts "Destroyed Textbooks" ######
#Destroy all Users
User.destroy_all
puts "Destroyed Users"
#Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users, classrooms, attendances, challenges, submissions, feedbacks, games RESTART IDENTITY CASCADE")
puts "RESET ID Numbers"

#STEP 2: SEED Textbooks --- ######
# require_relative 'seeds/textbooks'


#STEP 3: SEED Users - Classrooms - Attendances
require_relative 'seeds/users'
require_relative 'seeds/classrooms'
require_relative 'seeds/attendance'
require_relative 'seeds/challenges.rb'
require_relative 'seeds/submission.rb'
require_relative 'seeds/games.rb'
