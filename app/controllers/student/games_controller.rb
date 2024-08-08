class Student::GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def show
    # @game is already set by before_action
  end

  def edit
    # Exemple to try grammar game page.
    @words_array = ["tomorrow", "next", "banana", "apple", "thanks"]
    # @game is already set by before_action
    case @game.game_type
    when "grammar"
      render "grammar_game"
    when "spelling"
      render "spelling_game"
    when "vocabulary"
      render "vocabulary_game"
    end
  end

  def update
    if @game.update(game_params)
      redirect_to student_game_path(@game), notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:submission_id, :type, :correct_answer, :question, :student_answer, :score)
  end
end
