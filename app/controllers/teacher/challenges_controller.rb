class Teacher::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update]

  def index
    @challenges = policy_scope(Challenge)
  end

  def show
    authorize @challenge
  end

  def new
    # Create an array of all classrooms to be displayed in the form
    @classrooms = Classroom.all
    # Create an array of all books to be displayed in the form
    @textbooks = Textbook.all
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    authorize @challenge
    # Associating Textbook and Unit by default, after edit View DELETE this code
    @challenge.unit = Unit.where(textbook_id: 1).first
    @challenge.classroom_id = 1
    # DELETE UNTIL HERE
    if @challenge.save
      redirect_to teacher_challenge_path(@challenge), notice: 'Challenge submitted successfully!'
    else
      render :new
    end
  end

  def edit
    authorize @challenge
  end

  def update
    authorize @challenge
    @challenge.update(challenge_params)
    redirect_to challenge_path(@challenge), notice: 'Challenge updated successfully!'
  end

  private

  def challenge_params
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
