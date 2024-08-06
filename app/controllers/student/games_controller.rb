class Student::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      student_submission_game_path(@game), notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:submission_id, :type, :correct_answer, :question, :student_answer, :score)
  end
end
