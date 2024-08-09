class Teacher::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update]

  def index
    @challenges = policy_scope(Challenge)
    @classrooms = current_user.classrooms
    @submissions = current_user.challenges.flat_map(&:submissions)
    # Calculating Submissions % for Pie Chart
    # @submissions_content = @submissions.select { |submission| submission.content.present? }
    # @submissions_percantage = (@submissions_content.count/@submissions.count)*100
    # Number of students being taught by this professor
    @students = @classrooms.flat_map(&:students)
    # Number of feedbacks to be done
    @pending_feedbacks = @submissions.select { |submission| submission.feedbacks.first.nil? }.count

  end

  def show
    authorize @challenge
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
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
