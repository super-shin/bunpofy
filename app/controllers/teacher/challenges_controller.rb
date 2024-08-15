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

  def dashboard
    @challenges = policy_scope(Challenge)
    @classrooms = current_user.classrooms
    @submissions = current_user.challenges.flat_map(&:submissions)
    # Calculating Submissions % for Pie Chart
    @submissions_content = @submissions.select { |submission| submission.score.present? }
    @submissions_ratio = (@submissions_content.count.to_f/@submissions.count)*100
    # Calculating Grammar Game % for Pie Chart
    @games_grammar = @submissions.flat_map(&:games).select { |game| game.game_type == "grammar" }
    @games_grammar_score = @games_grammar.select { |game| game.score.present? }
    @games_grammar_ratio = if @games_grammar.count > 0
      (@games_grammar_score.count.to_f / @games_grammar.count) * 100
    else
      0
    end
    # Calculating Spelling Game % for Pie Chart
    @games_spelling = @submissions.flat_map(&:games).select { |game| game.game_type == "spelling" }
    @games_spelling_score = @games_spelling.select { |game| game.score.present? }
    @games_spelling_ratio = if @games_spelling.count > 0
      (@games_spelling_score.count.to_f / @games_spelling.count) * 100
    else
      0
    end
    # Calculating Vocabulary Game % for Pie Chart
    @games_vocabulary = @submissions.flat_map(&:games).select { |game| game.game_type == "vocab" }
    @games_vocabulary_score = @games_vocabulary.select { |game| game.score.present? }
    @games_vocabulary_ratio = if @games_vocabulary.count > 0
      (@games_vocabulary_score.count.to_f / @games_vocabulary.count) * 100
    else
      0
    end
    # Number of students being taught by this professor
    @students = @classrooms.flat_map(&:students)
    # Number of feedbacks to be done
    @pending_feedbacks = @submissions.select { |submission| submission.feedbacks.first.nil? }.count
    # Calculate completion rate per classroom including games
    @completion_rates = @classrooms.map do |classroom|
      classroom_submission = classroom.challenges.flat_map(&:submissions)
      classroom_games_grammar = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "grammar" && game.score.present? }
      classroom_games_spelling = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "spelling" && game.score.present? }
      classroom_games_vocab = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "vocab" && game.score.present? }
    end
    @completion_rates = {
      "Class A" => 70,
      "Class B" => 80,
    }       
  end

  private

  def challenge_params
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date, :photo)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
