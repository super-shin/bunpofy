class Teacher::FeedbacksController < ApplicationController
  before_action :set_submission, only: [:new :create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user_id = current_user.id
    @feedback.submission = @submission 
    if @feedback.save
      redirect_to challenge_path(@submission.challenge), notice: 'Feedback submitted successfully!'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end

  def set_submission
    @submission = Submission.find(params[:submission_id])
  end
end
