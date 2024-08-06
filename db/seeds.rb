# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require_relative 'seeds/textbooks'
Classroom.destroy_all
puts "Destroyed Classrooms"
# #Destroy all Users
User.destroy_all
puts "Destroyed Users"
# Reset ID key sequences
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users, classrooms RESTART IDENTITY CASCADE")
puts "RESET ID Number"
require_relative 'seeds/users'
require_relative 'seeds/classrooms'
