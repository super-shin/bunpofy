class Student::ChallengesController < ApplicationController
  def index
    @challenges = current_user.challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
