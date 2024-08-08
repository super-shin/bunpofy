class Student::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  def index
    @challenges = policy_scope(Challenge)
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
