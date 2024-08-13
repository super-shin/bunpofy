puts "Seeding Submission..."
Challenge.all.each do |challenge|
  challenge.students.each do |student|
    Submission.create({
      user_id: student.id,
      challenge_id: challenge.id,
      score: rand(50..100),
      })
    end
  end
puts "ALL DONE - Seeded Submissions"