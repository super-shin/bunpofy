class Teacher::FeedbacksController < ApplicationController
  before_action :set_submission, only: [:new, :create, :update]
  before_action :set_feedback, only: [:edit, :update]

  def new
    @feedback = Feedback.new
    authorize @feedback
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user_id = current_user.id
    @feedback.submission = @submission
    authorize @feedback
    if @feedback.save
      redirect_to teacher_challenge_path(@submission.challenge), notice: 'Feedback submitted successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @feedback.update(feedback_params)
    if @feedback.save
      redirect_to teacher_challenge_path(@submission.challenge), notice: 'Feedback submitted successfully!'
    else
      render :edit
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end

  def set_feedback
    @feedback = Feedback.find(params[:feedback_id])
  end

  def set_submission
    @submission = Submission.find(params[:submission_id])
  end
end
