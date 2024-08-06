class Student::SubmissionsController < ApplicationController
  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
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

  def submission_params
    params.require(:submission).permit(:challenge_id, :user_id, :content, :ai_response, :score)
  end
end
