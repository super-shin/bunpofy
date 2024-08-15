import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spelling-game"
export default class extends Controller {
  static values = { wordsArray: Array }
  connect() {
    const wordsArray = (this.wordsArrayValue);
    console.log("Selected words for the game:", wordsArray);
  }

  textToSpeech() {
    const utterance = new SpeechSynthesisUtterance(wordsArray);
    window.speechSynthesis.speak(utterance);
  }
}
