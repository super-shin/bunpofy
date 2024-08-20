import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="spelling-game"
export default class extends Controller {
  static values = { wordsArray: Array, correctSound: String, incorrectSound: String, jpwordsArray: Array };
  static targets = ['input', 'results'];

  connect() {
    this.emptyUserArray = [];
    this.emptyCorrectArray = [];
    this.generateRandomWord();
    this.correctSound = new Audio (this.correctSoundValue);
    this.incorrectSound = new Audio (this.incorrectSoundValue);
    this.hintWord();
    this.score = 0;
    this.maxAttempts = 2;
    this.currentAttempt = 0;
    this.gameOverFlag = false;
  }

  generateRandomWord() {
    this.resultsTarget.innerHTML = '';
    if (this.currentAttempt >= this.maxAttempts) {
      this.gameOver();
      return;
    }

    let randomIndex;
    do {
      randomIndex = Math.floor(Math.random() * this.wordsArrayValue.length);
    } while (this.emptyCorrectArray.includes(this.wordsArrayValue[randomIndex]));

    this.randomWord = this.wordsArrayValue[randomIndex];
    this.jpwords = this.jpwordsArrayValue[randomIndex];

    this.emptyCorrectArray.push(this.randomWord);
    console.log(this.emptyUserArray);
    console.log(this.emptyCorrectArray);
  }

  correctSpelling(event) {
    event.preventDefault();
    const resultElement = this.resultsTarget;
    const userInput = this.inputTarget.value.trim().toLowerCase();
    this.emptyUserArray.push(userInput);
    if (userInput === this.randomWord.toLowerCase()) {
      this.correctSound.play();
      this.score += 10;
      this.currentAttempt++;
      this.updateScore();
      resultElement.innerHTML = `
        <div class="d-flex align-items-center justify-content-center">
          <i class="fa fa-check-circle" aria-hidden="true"></i>
          <p id="correct">
          Correct, You did great!</p>
        </div>
        <i class="fa fa-forward fa-2x text-white" id="next-word-button"></i>
      `;
      document.getElementById('next-word-button').addEventListener('click', () => {
        this.inputTarget.value = '';
        this.generateRandomWord();
        this.hintWord();
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
      document.getElementById('hint').innerHTML = '';
      const correction = document.getElementById('hint');
      correction.innerHTML = `<p id="displayHint">Correct Spelling: ${this.randomWord}</p>`;
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

  hintWord() {
    const divElement = document.getElementById('hint');
    divElement.innerHTML = `<p id="displayHint">HINT: ${this.jpwords}</p>`;
  }

  updateScore() {
    const newScore = document.getElementById('score');
    newScore.innerHTML = `
    <div class="d-flex align-items-center justify-content-center">
      <p id="displayHint">EARNED: ${this.score} POINTS<p>
      <lord-icon
        src="https://cdn.lordicon.com/eiwtsgei.json"
        trigger="loop"
        state="loop-cycle"
        style="width:50px;height:50px">
      </lord-icon>
    </div>`;
  }

  gameOver() {
    this.gameOverFlag = true;
    document.getElementById('score').innerHTML ='';
    document.getElementById('hint').innerHTML = '';
    const resultElement = this.resultsTarget;
    resultElement.innerHTML = `
      <div class="d-flex align-items-center justify-content-center">
        <p id="congrats">
          Congratulations on completing the game! You scored ${this.score} points.
        </p>
      </div>
      <div class="firework"></div>
      <div class="firework"></div>
      <div class="firework"></div>
    `;
    this.inputTarget.disabled = true;
  }

}
