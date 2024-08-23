import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["loading"]

  connect() {
    console.log('Hello from LOADER CONTROLLER');
    
    document.addEventListener("turbo:submit-end", (event) => {
      this.toggleLoading();
    });
  }

  submitForm(event) {
    console.log('Hello from SUBMIT');
    this.toggleLoading();
  }

  toggleLoading() {
    this.loadingTarget.classList.toggle("d-none");
  }
}
