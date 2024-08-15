# app/services/gemini_service.rb
require 'httparty'
require 'json'

class GeminiService
  include HTTParty
  base_uri 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash'

  PROMPT_ONE = <<~PROMPT
    Please correct the following sentence for proper grammar and clarity. Provide the result in this format:
    {
      "jSONRESPONSE_sentence": "TechnicallyCorrectSentence",
      "clarity": OriginalSentenceClarityScorePercentage,  
      "alternatives": ["AlternativeSentence1", "AlternativeSentence2", ...]
    }
    Sentence:
  PROMPT

  PROMPT_TWO = <<~PROMPT
    You are a strict grammar checker. Compare the original and corrected sentences, identify, check, and categorize each error (Punctuation, Spelling, Capitalization, Grammar, Style, Usage, Clarity). The sentence is made by a Japanese ESL student; fix words that might come from their native language and properly translate them to the English counterpart or the nearest meaning. Ensure each error is categorized only once. Provide the result in this format:
    {
      "correctedText": {original JSON from corrected sentence},
      "info": {
        "score" : "1-100 score based on errors",
        "chars_count": "information",
        "word_count": "information",
        "sentence_count": "information",
        "pos_tagging_with_index": "Array of arrays format, e.g., [['word', 'POS'], ['example', 'NN']]",
        "original_sentence": "OriginalSentence",
        "corrected_sentence": "CorrectedSentence"
      },
      "errors": [
        {
          "type": "ErrorType",
          "subcategory": "Subcategory Name",
          "description": "ErrorDescription",
          "problematic_segment": "Segment",
          "suggested_alternative": "AlternativePhraseOrWord"
        },
        ...
      ]
    }
  PROMPT

  def initialize(api_key)
    @api_key = api_key
  end

  def generate_content(input_text)
    # Step 1: Correct the sentence using Prompt One
    corrected_response = request_to_api("#{PROMPT_ONE} #{input_text}")
    if corrected_response && corrected_response['candidates'] && !corrected_response['candidates'].empty?
      corrected_json_text = corrected_response['candidates'].first['content']['parts'].first['text']
      
      # Step 2: Extract the corrected sentence from Prompt One response
      corrected_result = parse_json_response(corrected_json_text)

      # Step 3: Analyze the original sentence using Prompt Two
      grammar_check_response = request_to_api("Original Sentence: #{input_text} Corrected Sentence: #{corrected_result} #{PROMPT_TWO}")
      if grammar_check_response && grammar_check_response['candidates'] && !grammar_check_response['candidates'].empty?
        grammar_check_json_text = grammar_check_response['candidates'].first['content']['parts'].first['text']
        grammar_check_result = parse_json_response(grammar_check_json_text)

        # Return results from grammar check
        {
          corrected_text: grammar_check_result['correctedText'],
          info: grammar_check_result['info'],
          errors: grammar_check_result['errors']
        }
      else
        Rails.logger.warn("Received empty or invalid response for grammar check.")
        nil
      end
    else
      Rails.logger.warn("Received empty or invalid response for correction.")
      nil
    end
  end

  private

  def request_to_api(prompt)
    options = {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        contents: [
          {
            role: 'user',
            parts: [
              {
                text: "#{prompt}"
              }
            ]
          }
        ],
        generationConfig: {
          temperature: 0.2,
          topK: 64,
          topP: 0.95,
          maxOutputTokens: 5000,
          responseMimeType: 'application/json'
        }
      }.to_json
    }

    response = self.class.post("/:generateContent?key=#{@api_key}", options)
    Rails.logger.info("Response Code: #{response.code}")
    Rails.logger.info("Response Body: #{response.body}")
    if response.success?
      response.parsed_response
    else
      Rails.logger.error("Request failed: #{response.message}")
      nil
    end
  end

  def parse_json_response(text)
    begin
      JSON.parse(text)
    rescue JSON::ParserError => e
      Rails.logger.error("Failed to parse JSON response: #{e.message}")
      nil
    end
  end
end
