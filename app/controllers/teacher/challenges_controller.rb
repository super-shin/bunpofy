class Teacher::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update]

  def index
    @challenges = policy_scope(Challenge)
  end

  def show
    authorize @challenge
    @challenge = Challenge.find(params[:id])
    @submissions = Submission.where(challenge_id: @challenge.id)
    @feedback = Feedback.new
    submission_ids_with_feedback = Feedback.pluck(:submission_id).uniq
    students_with_submissions = @challenge.classroom.students.joins(:submissions).where(submissions: { id: @submissions.pluck(:id) })

    # Students who have submitted work BUT not received feedback
    @students_without_feedback = students_with_submissions.where.not(submissions: { id: submission_ids_with_feedback }).order('submissions.score ASC')
    
    # Students who have submitted work AND received feedback
    @students_with_submissions = students_with_submissions.order('submissions.score DESC') - @students_without_feedback
    
    # Students who have NOT submitted any work
    @students_without_submissions = @challenge.classroom.students.where.not(id: @students_with_submissions.pluck(:id)) - @students_without_feedback
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
    @missions_completed = @submissions.count + @submissions.flat_map(&:games).select {|game| game.score.present?}.count
    @submissions_plus_not_created = Attendance.joins(classroom: :challenges)
    .where('classrooms.user_id': User.find_by(first_name: "Teacher").id).count
    # Calculating Submissions % for Pie Chart
    @submissions_content = @submissions.select { |submission| submission.score.present? }
    @submissions_ratio = (@submissions.count.to_f/@submissions_plus_not_created)*100
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
    @pending_feedbacks = @submissions.select { |submission| submission.feedback.nil? }.count
    # Calculate completion rate per classroom including games
    @completion_rates = @classrooms.map do |classroom|
      classroom_submission = classroom.challenges.flat_map(&:submissions)
      classroom_games_grammar = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "grammar" && game.score.present? }
      classroom_games_spelling = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "spelling" && game.score.present? }
      classroom_games_vocab = classroom_submission.flat_map(&:games).filter { |game| game.game_type == "vocab" && game.score.present? }
    end
    @sentence_average_score = Submission.joins(challenge: :classroom).where('classrooms.user_id': current_user.id)
    .group(:name).average(:score).transform_values(&:floor)
    @grammar_average_score = Game.joins(submission: { challenge: :classroom })
    .where('classrooms.user_id': current_user.id)
    .where(game_type: 'grammar').where.not(score: nil).group(:name).average(:score).transform_values(&:floor)
    @spelling_average_score = Game.joins(submission: { challenge: :classroom })
    .where('classrooms.user_id': current_user.id)
    .where(game_type: 'spelling').where.not(score: nil).group(:name).average(:score).transform_values(&:floor)
    @vocab_average_score = Game.joins(submission: { challenge: :classroom })
    .where('classrooms.user_id': current_user.id)
    .where(game_type: 'vocab').where.not(score: nil).group(:name).average(:score).transform_values(&:floor)
    @sentence_average_score_per_time = Submission.joins(challenge: :classroom).where('classrooms.user_id': current_user.id)
    .group(:due_date).order(:due_date).average(:score).transform_values(&:floor)
    @spelling_average_score_per_time = Game.joins(submission: { challenge: :classroom }).where('classrooms.user_id': current_user.id)
    .where(game_type: 'spelling').where.not(score: nil).group(:due_date).order(:due_date).average(:score).transform_values(&:floor)
    @vocab_average_score_per_time = Game.joins(submission: { challenge: :classroom }).where('classrooms.user_id': current_user.id)
    .where(game_type: 'vocab').where.not(score: nil).group(:due_date).order(:due_date).average(:score).transform_values(&:floor)
    @grammar_average_score_per_time = Game.joins(submission: { challenge: :classroom }).where('classrooms.user_id': current_user.id)
    .where(game_type: 'grammar').where.not(score: nil).group(:due_date).order(:due_date).average(:score).transform_values(&:floor)
  end

  private

  def challenge_params
    params.require(:challenge).permit(:unit_id, :classroom_id, :title, :directions, :due_date, :photo)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end


