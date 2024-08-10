class Teacher::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update]

  def index
    @challenges = policy_scope(Challenge)
  end

  def show
    authorize @challenge
    @challenge = Challenge.find(params[:id])
    @submissions = @challenge.submissions
  end

  def new
    # Create an array of all classrooms to be displayed in the form
    @classrooms = current_user.classrooms
    # Create an array of all books to be displayed in the form
    @textbooks = Textbook.all
    @units_by_textbook = Unit.all.group_by(&:textbook_id)
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.classroom = current_user.classrooms.first
    authorize @challenge
    if @challenge.save
      redirect_to teacher_challenge_path(@challenge), notice: 'Challenge submitted successfully!'
    else
      render :new
      Rails.logger.error("Challenge save failed: #{@challenge.errors.full_messages.join(', ')}")
    end
  end

  def edit
    authorize @challenge
  end

  def update
    authorize @challenge
    @challenge.update(challenge_params)
    redirect_to teacher_challenge_path(@challenge), notice: 'Challenge updated successfully!'
  end

  private

  def challenge_params
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date, :photo)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
