puts "Seeding Games..."
Submission.all.each do |submission|
  Game.create({submission_id: submission.id,
    game_type: "grammar",
  })
  Game.create({submission_id: submission.id,
    game_type: "spelling",
  })
  Game.create({submission_id: submission.id,
    game_type: "vocabulary"
  })
end
puts "ALL DONE - Seeded Games"