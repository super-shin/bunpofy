puts "Seeding Games..."
Submission.all.each do |submission|
  Game.create({
    submission_id: submission.id,
    game_type: "grammar",
    score: rand(50..100)
  })
  Game.create({
    submission_id: submission.id,
    game_type: "spelling",
    score: rand(50..100)
  })
  Game.create({
    submission_id: submission.id,
    game_type: "vocab",
    score: rand(50..100)
  })
end
puts "ALL DONE - Seeded Games"