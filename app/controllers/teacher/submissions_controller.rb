class Teacher::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show]

  def show
    #@submission is set up in before action
    authorize @submission
    @ai_resposne = @ai_response = JSON.parse(@submission.ai_response) if @submission.ai_response.present?
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
