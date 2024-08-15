class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @challenges = policy_scope(Challenge).order(created_at: :desc)
    # Defining array for leaderboard users
    @classrooms = current_user.classrooms_as_student
    @students = @classrooms.flat_map(&:students)
    # Calculating all XP gained for this student
    submissions_xp = current_user.submissions.map{|submission| submission.score}.sum
    games_xp = current_user.submissions.flat_map(&:games).select{|game| game.score.present?}.map{|game| game.score}.sum
    @experience = submissions_xp + games_xp
    # Creating students array based on the experience amount
    @students_ranking = @classrooms.flat_map(&:students).sort_by do |student|
      submission_scores = student.submissions.map(&:score).compact.sum
      game_scores = student.submissions.flat_map(&:games).map(&:score).compact.sum
      submission_scores + game_scores
    end.reverse
    ## Implement the level system here whem it is done
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
