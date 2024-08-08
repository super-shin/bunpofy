class Student::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :new, :create]

  def show
    # @submission it's already set by before_action
    authorize @submission
  end

  def new
    @submission = Submission.new
    authorize @submission
  end

  def create
    @submission = Submission.new(submission_params)
    authorize @submission
    if @submission.save
      redirect_to student_submission_path(@submission), notice: 'Submission was successfully created.'
    else
      render :new
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:challenge_id, :user_id, :content, :ai_response, :score)
  end

end
