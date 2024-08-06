class Teacher::ChallengesController < ApplicationController
  def index
    @challenges = current_user.challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    # Create an array of all classrooms to be displayed in the form
    @classrooms = Classroom.all
    # Create an array of all books to be displayed in the form
    @textbooks = Textbook.all
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
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
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
    redirect_to challenge_path(@challenge), notice: 'Challenge updated successfully!'
  end

  private

  def challenge_params
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date)
  end
end
