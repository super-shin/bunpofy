class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @challenges = policy_scope(Challenge).order(created_at: :desc)
    # First row of the challenges
    @top_challenges = @challenges.first(3)
    # Second row and remaining challenges if exist
    @remaining_challenges = @challenges.drop(3)
    # Defining array for leaderboard users
    @classrooms = current_user.classrooms_as_student
    # Calculating all XP gained for current user
    submissions_xp = current_user.submissions.map{|submission| submission.score}.sum
    games_xp = current_user.submissions.flat_map(&:games).select{|game| game.score.present?}.map{|game| game.score}.sum
    @experience = submissions_xp + games_xp
    # Calculating level for current user
    @level = 1 + (@experience/500).floor
    # Creating students array based on the experience amount
    student_scores = Hash.new { |hash, key| hash[key] = { student: nil, score: 0 } }
    @classrooms.flat_map(&:students).each do |student|
      submission_scores = student.submissions.map(&:score).compact.sum
      game_scores = student.submissions.flat_map(&:games).map(&:score).compact.sum
      student_scores[student.id][:student] = student
      student_scores[student.id][:score] += submission_scores + game_scores
    end
    @students_ranking = student_scores.values.sort_by { |entry| -entry[:score] }.map { |entry| entry[:student] }
  end

  def show
    # @challenge is already set by before_action
    authorize @challenge
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
