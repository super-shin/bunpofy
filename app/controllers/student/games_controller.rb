class Student::GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def show
    # @game is already set by before_action
  end

  def edit
    # @game is already set by before_action
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
