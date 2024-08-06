class Student::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :new, :create]

  def show
    # @submission is already set by before_action
  end

  def new
    # @submission is already set by before_action
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to student_submission_path(@submission), notice: 'Submission was successfully created.'
    else
      render :new
    end
  end

  private

  def set_submission
    @submission = params[:id] ? Submission.find(params[:id]) : Submission.new
  end

  def submission_params
    params.require(:submission).permit(:challenge_id, :user_id, :content, :ai_response, :score)
  end

end
