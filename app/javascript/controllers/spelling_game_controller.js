import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="spelling-game"
export default class extends Controller {
  static values = { wordsArray: Array };
  static targets = ['input', 'results'];

  connect() {
    this.generateRandomWord();
  }

  generateRandomWord() {
    const randomIndex = Math.floor(Math.random() * this.wordsArrayValue.length);
    this.randomWord = this.wordsArrayValue[randomIndex];
    // console.log('Selected word for the game:', this.randomWord);
  }

  correctSpelling(event) {
    event.preventDefault();
    const resultElement = this.resultsTarget
    const userInput = this.inputTarget.value.trim().toLowerCase();
    if (userInput === this.randomWord.toLowerCase()) {
      resultElement.innerHTML =
      `<p id="correct">
          Correct, You did great!
          <i class="fa fa-check-circle" aria-hidden="true"></i>
        </p>`;
    } else {
      resultElement.innerHTML = `
      <p id="incorrect">
        Incorrect, Please try again!
        <i class="fa fa-times-circle" aria-hidden="true"></i>
      </p>`;
    }
  }

  textToSpeech() {
    const utterance = new SpeechSynthesisUtterance(this.randomWord);
    window.speechSynthesis.speak(utterance);
  }
}
