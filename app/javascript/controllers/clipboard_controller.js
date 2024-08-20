import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source", "copybutton"];

  copy(event) {
    console.log('Text-content',this.sourceTarget.textContent,'Target', this.sourceTarget);
    event.preventDefault();
    const textToCopy = this.sourceTarget.textContent;
    navigator.clipboard.writeText(textToCopy);
    this.copybuttonTarget.classList.toggle('text-white');
    setTimeout(() => {
      this.copybuttonTarget.classList.toggle('text-white');
    }, 500);
  }
}