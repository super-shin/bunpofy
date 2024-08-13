class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @challenges = policy_scope(Challenge)
    # Defining array for leaderboard users
    @classrooms = current_user.classrooms_as_student
    @students = @classrooms.flat_map(&:students)
    # Calculating all XP gained for this student
    submissions_xp = current_user.submissions.map{|submission| submission.score}.sum
    games_xp = current_user.submissions.flat_map(&:games).select{|game| game.score.present?}.map{|game| game.score}.sum
    @experience = submissions_xp + games_xp
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
