import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="spelling-game"
export default class extends Controller {
  static values = { wordsArray: Array, correctSound: String, incorrectSound: String };
  static targets = ['input', 'results'];

  connect() {
    this.generateRandomWord();
    this.correctSound = new Audio (this.correctSoundValue);
    this.incorrectSound = new Audio (this.incorrectSoundValue)
  }

  generateRandomWord() {
    const randomIndex = Math.floor(Math.random() * this.wordsArrayValue.length);
    this.randomWord = this.wordsArrayValue[randomIndex];
    // console.log('Selected word for the game:', this.randomWord);
  }

  correctSpelling(event) {
    event.preventDefault();
    const resultElement = this.resultsTarget;
    const userInput = this.inputTarget.value.trim().toLowerCase();
    if (userInput === this.randomWord.toLowerCase()) {
      this.correctSound.play();
      resultElement.innerHTML = `

        <div class="d-flex align-items-center justify-content-center">
          <i class="fa fa-check-circle" aria-hidden="true"></i>
          <p id="correct">
          Correct, You did great!</p>
        </div>
        <i class="fa fa-forward fa-2x text-white" id="next-word-button"></i>
        <div class="firework"></div>
        <div class="firework"></div>
      `;
      document.getElementById('next-word-button').addEventListener('click', () => {
        this.inputTarget.value = '';
        this.generateRandomWord();
        resultElement.innerHTML = '';
      });
    } else {
      this.incorrectSound.play();
      resultElement.innerHTML = `
      <div class="d-flex align-items-center justify-content-center">
        <i class="fa fa-times-circle" aria-hidden="true"></i>
        <p id="incorrect">
          Incorrect, Please try again!
        </p>
      </div>
        <i class="fa fa-rotate-right fa-2x text-white" id="try-again-button"></i>
      `;
      document.getElementById('try-again-button').addEventListener('click', () => {
        this.inputTarget.value = '';
        resultElement.innerHTML = '';
      });
    }
  }

  textToSpeech() {
    const utterance = new SpeechSynthesisUtterance(this.randomWord);
    window.speechSynthesis.speak(utterance);
  }
}
