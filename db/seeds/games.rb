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

puts "Seeding Games..."
Submission.all.each do |submission|
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
