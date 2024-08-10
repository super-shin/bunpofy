import { Controller } from "@hotwired/stimulus"
import { GoogleGenerativeAI } from "https://esm.run/@google/generative-ai";

// Connects to data-controller="sentensensei"
export default class extends Controller {
  static targets = ['content', 'aiResponse', 'score']
  static values = {apiKey: String}
  JSONRESPONSE = []

  // Define the prompts
  PROMPT_ONE = `Please correct the following sentence for proper grammar and clarity. Provide the result in this format:
{
  "jSONRESPONSE_sentence": "TechnicallyCorrectSentence",
  "clarity": OriginalSentenceClarityScorePercentage,  
  "alternatives": ["AlternativeSentence1", "AlternativeSentence2", ...]
}

Sentence: `;

  PROMPT_TWO = `You are a strict grammar checker. Compare the original and corrected sentences, identify, check, and categorize each error (Punctuation, Spelling, Capitalization, Grammar, Style, Usage, Clarity). The sentence is made by a Japanese ESL student; fix words that might come from their native language and properly translate them to the English counterpart or the nearest meaning. Ensure each error is categorized only once. Provide the result in this format:

{
  "correctedText": {original JSON from corrected sentence},
  "info": {
    "score" : "1-100 score based on erros"
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
  ]}`;
  
  connect() {
    console.log(this.contentTarget);
    console.log(this.aiResponseTarget);
    console.log(this.scoreTarget);
  }

  async check(event) {
    event.preventDefault();

    // GET content and BUILD Prompt
    const content = this.contentTarget.value;
    const promptOne = `${this.PROMPT_ONE} ${content}`;

    //INITIALIZE AI
    const genAI = new GoogleGenerativeAI(this.apiKeyValue);

    const generation_config = {
      "temperature": 0.2,
      "top_p": 0.95,
      "top_k": 64,
      "max_output_tokens": 8192,
      "response_mime_type": "application/json"
    }

    const model = await genAI.getGenerativeModel({ model: "gemini-1.5-flash", generationConfig: generation_config });

    // GET RESPONSE
    try {
      //GET Response for PromptOne
      console.log("AI is Starting the Check...");
      const resultOne = await model.generateContent(promptOne);
      const responseOne = await resultOne.response;
      const correctedText = await responseOne.text();
      console.log("AI Passed the First Prompt");

      //DISPLAY PromptOne
      document.getElementById('response-prompt1').innerText = correctedText.trim();

      //DEFINE PromptTwo
      const promptTwo = `Original Sentence: ${content} Corrected Sentence: ${correctedText.trim()} ${this.PROMPT_TWO} `;

      // GET Response for PromptTwo
      console.log("Passing the Second Prompt");
      const resultTwo = await model.generateContent(promptTwo);
      const responseTwo = await resultTwo.response;
      const analysisText = await responseTwo.text();
      console.log("Passed the Second Prompt");

      //DISPLAY PromptTwo
      document.getElementById('response-prompt2').innerText = analysisText.trim();
      this.JSONRESPONSE = analysisText.trim()
    } catch (error) {
      console.error("Error generating content:", error);
    } finally {
      // this.scoreTarget.value = correctedText.trim();
      console.log("FINISHED ASYNC FUNTION");
      this.aiResponseTarget.value = this.JSONRESPONSE
    }
    // Submit the form programmatically
    this.element.submit();
  }
}
