class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @challenges = current_user.challenges
  end

  def show
    # @challenge is already set by before_action
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
