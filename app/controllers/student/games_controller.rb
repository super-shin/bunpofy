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
    @words_array = @words_relation.sample(4).map(&:english)
    @words_array_spelling = @words_relation.limit(10).map(&:english)
    # @words_array_spelling = ["house", "dog", "friendly"]
    # Pass the game and submission ID info to the Javascript Controller
    @game_id = @game.id
    @submission_id = @game.submission_id
    # @game is already set by before_action
    render "#{@game.game_type}_game"
  end

  def update
    authorize @game
    if @game.update(score: params[:score])
      params[:questions].each do |question|
        @game.questions.create(
          correct_answer: question[:correct_answer],
          options: question[:options],
          student_answer: question[:student_answer]
        )
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
