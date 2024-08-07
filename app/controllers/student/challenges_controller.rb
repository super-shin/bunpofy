class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @student_classrooms = @current_user.classrooms_as_student
  end

  def show
    # @challenge is already set by before_action
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
