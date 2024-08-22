puts "Seeding Feedback for Submissions (excluding user_id 59 Kawaguchi Ryo)..."

feedback_content = ["Great job!", "Awesome work", "Good job", "This is nice!", "Excellent work!", "Well done!", "Fantastic effort!", "Keep up the great work!", "Impressive submission!", "You did a great job!", "Nice work!", "Very well done!", "You're on the right track!", "Great effort!", "Bravo on this submission!", "Outstanding job!", "Keep going, you're doing great!", "Your effort is commendable!", "You're making great progress!", "Well done, keep it up!", "You're improving with each submission!", "Good start, but consider adding more detail.", "Great effort, but try to refine your approach a bit.", "Good job overall, but there are a few areas for improvement.", "Nice work! Here are some tips to enhance your submission.", "Good attempt, consider reviewing some of the details.", "You're making great strides!", "Keep pushing forward, you're doing awesome!", "Your hard work is paying off!", "You`re doing really well-keep at it!", "Stay motivated, you're doing a fantastic job!", "Great job! I love your creativity!", "Your unique approach is appreciated!", "Nice work! Your creativity really shines through!", "Well done, your innovative ideas are impressive!", "Fantastic job with your creative approach!", "You've put in a lot of effort, and it shows!", "Your dedication is evident in this submission!", "It's clear you've worked hard on this!", "Great job showing your commitment!", "Your effort and attention to detail are impressive!"]

submissions = Submission.where.not(user_id: 59)

submissions.find_each do |submission|
  Feedback.create!(
    submission_id: submission.id,
    user_id: submission.challenge.user_id,
    content: feedback_content.sample
  )
end

puts "ALL DONE - Seeded Feedback for Submissions (excluding user_id 59 Kawaguchi Ryo)"
