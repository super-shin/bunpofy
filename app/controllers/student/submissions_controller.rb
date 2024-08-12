class Student::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show]
  before_action :set_challenge, only: [:new, :create]

  def show
    # @submission it's already set by before_action
    authorize @submission
    @ai_response = JSON.parse(@submission.ai_response) if @submission.ai_response.present?
    @textbook = @submission.challenge.unit.textbook
    @content_words = @submission.content.downcase.scan(/\w+/).uniq
    @word_details = Word.where("LOWER(english) IN (?)", @content_words).pluck(:english, :level, :grade).uniq
  rescue JSON::ParserError
    @ai_response = { "errors" => [] }
  end

  def new
    @submission = @challenge.submissions.build
    authorize @submission
    @api_key = ENV['GEMINI_KEY']
  end

  def create
    @submission = @challenge.submissions.build(submission_params)
    @submission.user = current_user
    ai_response_data = JSON.parse(@submission.ai_response)
    @submission.score = ai_response_data['info']['score'].to_i
    authorize @submission
    if @submission.save
      # Creating the games at the creationg of a NEW submission
      @game_grammar = @submission.games.build(game_type: "grammar")
      @game_grammar.save
      @game_spelling = @submission.games.build(game_type: "spelling")
      @game_spelling.save
      @game_vocab = @submission.games.build(game_type: "vocab")
      @game_vocab.save
      redirect_to student_submission_path(@submission), notice: 'Submission was successfully created.'
    else
      render :new
      Rails.logger.error("Submission save failed: #{@submission.errors.full_messages.join(', ')}")
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def submission_params
    params.require(:submission).permit(:challenge_id, :user_id, :content, :ai_response, :score)
  end

end
