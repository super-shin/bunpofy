class Student::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :selection]
  before_action :set_challenge, only: [:new, :create]

  def show
    # @submission it's already set by before_action
    authorize @submission
    @ai_response = JSON.parse(@submission.ai_response) if @submission.ai_response.present?
    @textbook = @submission.challenge.unit.textbook
    @content_words = @submission.content.downcase.scan(/\w+/).uniq
    @word_details = Word.where("LOWER(english) IN (?)", @content_words).pluck(:english, :level, :grade).uniq
  end

  def new
    @submission = @challenge.submissions.build
    authorize @submission
  end

  def create
    @submission = @challenge.submissions.build(submission_params)
    @submission.user = current_user
    if @submission.user.email == 'zhangrei@minami.com'
      @submission.ai_response = pitch_response
    else
      @submission.ai_response = generate(@submission.content)
    end
    @ai_response_data = JSON.parse(@submission.ai_response) if @submission.ai_response.present?
    
    if @ai_response_data
      @submission.score = @ai_response_data['info']['score'].to_i
    else
      @submission.score = 0
    end
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

  def selection
    # @submission it's already set by before_action
    authorize @submission
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

  def generate(final_prompt)
    api_key = ENV['GEMINI_KEY']
    gemini_service = GeminiService.new(api_key)
  
    gemini_service.generate_content(final_prompt).to_json
  end

  def pitch_response
    {
      "corrected_text" => {
        "jSONRESPONSE_sentence" => "My favorite animal is the elephant. I am always excited to go to the zoo to see them.",
        "clarity" => "60",
        "alternatives" => [
          "Elephants are my favorite animals. I always get excited when I go to the zoo to see them.",
          "I love elephants. I always look forward to visiting the zoo to see them."
        ]
      },
      "info" => {
        "score" => "70",
        "chars_count" => 102,
        "word_count" => 19,
        "sentence_count" => 2,
        "pos_tagging_with_index" => [
          ["My", "PRP$"],
          ["favorite", "JJ"],
          ["animal", "NN"],
          ["is", "VBZ"],
          ["a", "DT"],
          ["elefant", "NN"],
          ["I", "PRP"],
          ["am", "VBZ"],
          ["always", "RB"],
          ["excited", "JJ"],
          ["to", "TO"],
          ["go", "VB"],
          ["to", "TO"],
          ["the", "DT"],
          ["zoo", "NN"],
          ["'s", "POS"],
          ["to", "TO"],
          ["see", "VB"],
          ["them", "PRP"]
        ],
        "original_sentence" => "My favorite animal is a elefant. I am always excited to go to the zoo's to see them.",
        "corrected_sentence" => "My favorite animal is the elephant. I am always excited to go to the zoo to see them."
      },
      "errors" => [
        {
          "type" => "Spelling",
          "subcategory" => "Misspelled Word",
          "description" => "The word 'elefant' is misspelled. The correct spelling is 'elephant'.",
          "problematic_segment" => "elefant",
          "suggested_alternative" => "elephant"
        },
        {
          "type" => "Punctuation",
          "subcategory" => "Unnecessary Punctuation",
          "description" => "The punctuation is unnecessary after 'zoo'.",
          "problematic_segment" => "'",
          "suggested_alternative" => ""
        },
        {
          "type" => "Grammar",
          "subcategory" => "Article Usage",
          "description" => "The article 'a' should be replaced with 'the' because the sentence is referring to a specific elephant.",
          "problematic_segment" => "a elefant",
          "suggested_alternative" => "the elephant"
        }
      ]
    }.to_json
  end
  
end
