class Student::GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def show
    # @game is already set by before_action
  end

  def edit
    authorize @game
    @api_key = ENV['GEMINI_KEY']
    # Get the ActiveRecord relation of words associated with the unit
    @words_relation = @game.submission.challenge.unit.words
    # Sample 5 unique words
    @words_array = @words_relation.sample(2).map(&:english)
    @words_array_spelling = @words_relation.limit(10).map(&:english)
    # @words_array_spelling = ["house", "dog", "friendly"]
    # Calculate the current user level
    submissions_xp = current_user.submissions.map{|submission| submission.score}.sum
    games_xp = current_user.submissions.flat_map(&:games).select{|game| game.score.present?}.map{|game| game.score}.sum
    @experience = submissions_xp + games_xp
    @level = 1 + (@experience/500).floor
    # Pass the game and submission ID info to the Javascript Controller
    @game_id = @game.id
    @submission_id = @game.submission_id
    # @game is already set by before_action
    render "#{@game.game_type}_game"
  end

  def update
    authorize @game
    if @game.update(score: params[:score])
      existing_question = @game.questions.find_by(game_id: @game.id)
      if existing_question
        params[:questions].each do |question|
          # Update the existing question
          existing_question.update(
            correct_answer: question[:correct_answer],
            options: question[:options],
            student_answer: question[:student_answer]
          )
        end
      # Create a new question if no matching question is found
      else
        params[:questions].each do |question|
          @game.questions.create(
            game_id: @game.id,
            correct_answer: question[:correct_answer],
            options: question[:options],
            student_answer: question[:student_answer]
          )
        end
      end
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(
      :score, 
      questions_attributes: [
        :correct_answer, 
        :options, 
        :student_answer
      ]
    )
  end
end
