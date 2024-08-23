def weighted_score_for_game_type(game_type)
  case game_type
  when "grammar"
    low_range = 50..73
    low_probability = 0.7
    mid_range = 74..83
    mid_probability = 0.3
    high_range = 84..100
    high_probability = 0.0
  when "spelling"
    low_range = 50..73
    low_probability = 0.0
    mid_range = 74..83
    mid_probability = 0.3
    high_range = 84..100
    high_probability = 0.7
  when "vocab"
    low_range = 50..73
    low_probability = 0.0
    mid_range = 74..83
    mid_probability = 0.7
    high_range = 84..100
    high_probability = 0.3
  else
    return rand(50..100)
  end

  rand_num = rand
  case 
  when rand_num < low_probability
    rand(low_range)
  when rand_num < (low_probability + mid_probability)
    rand(mid_range)
  else
    rand(high_range)
  end
end

puts "Seeding Games for challenge id: 19"
Submission.where(challenge_id: 19).each do |submission|
  Game.create({
    submission_id: submission.id,
    game_type: "grammar",
    score: weighted_score_for_game_type("grammar")
  })
  Game.create({
    submission_id: submission.id,
    game_type: "spelling",
    score: weighted_score_for_game_type("spelling")
  })
  Game.create({
    submission_id: submission.id,
    game_type: "vocab",
    score: weighted_score_for_game_type("vocab")
  })
end

puts "Done!"

puts "Seeding Games for other challenges in IC 3-1..."

Submission.where(challenge_id: 12..18).each do |submission|
  score = if submission.user_id == 79
    120
  else
    (10 + ((submission.user_id - 58) * 4) + ((submission.challenge_id - 11) * 2))
  end
  Game.create({
    submission_id: submission.id,
    game_type: "grammar",
    score: score
  })
  Game.create({
    submission_id: submission.id,
    game_type: "spelling",
    score: score
  })
  Game.create({
    submission_id: submission.id,
    game_type: "vocab",
    score: score
  })
end

puts "Done!"

puts "Seeding Games for other challenges in Miyagiken classrooms..."

Submission.where(challenge_id: 5..11).each do |submission|
  if (5..13).include?(submission.user_id)
    Game.create({
      submission_id: submission.id,
      game_type: "grammar",
    })
  else
    Game.create({
      submission_id: submission.id,
      game_type: "grammar",
      score: (50 + ((submission.challenge_id - 4) * 3))
    })
  end
end

Submission.where(challenge_id: 5..11).each do |submission|
  if (5..11).include?(submission.user_id)
    Game.create({
      submission_id: submission.id,
      game_type: "spelling",
    })
  else
    Game.create({
      submission_id: submission.id,
      game_type: "spelling",
      score: (50 + ((submission.challenge_id - 4) * 4))
    })
  end
end

Submission.where(challenge_id: 5..11).each do |submission|
  if (5..15).include?(submission.user_id)
    Game.create({
      submission_id: submission.id,
      game_type: "vocab",
    })
  else
    Game.create({
      submission_id: submission.id,
      game_type: "vocab",
      score: (50 + ((submission.challenge_id - 4) * 5))
    })
  end
end

puts "Done!"

puts "Seeding Games for remaining challenges..."

Submission.where(challenge_id: 1..5).each do |submission|
  Game.create({
    submission_id: submission.id,
    game_type: "grammar",
    score: weighted_score_for_game_type("grammar")
  })
  Game.create({
    submission_id: submission.id,
    game_type: "spelling",
    score: weighted_score_for_game_type("spelling")
  })
  Game.create({
    submission_id: submission.id,
    game_type: "vocab",
    score: weighted_score_for_game_type("vocab")
  })
end

puts "ALL DONE - Seeded Games"
