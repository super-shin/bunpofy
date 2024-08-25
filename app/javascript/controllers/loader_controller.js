import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { email: String } // Define a static value for email
  static targets = ["loading"]

  connect() {
    console.log('Hello from LOADER CONTROLLER');
    console.log(this.emailValue);
    
    document.addEventListener("turbo:submit-end", (event) => {
      this.toggleLoading();
    });
  }

  submitForm(event) {
    event.preventDefault(); // Prevent immediate form submission
    console.log('Hello from SUBMIT');
    this.toggleLoading();

    // Access the email value
    const userEmail = this.emailValue;
    const delay = userEmail === "kawaguchiryo@minami.com" ? 4000 : 0;

    setTimeout(() => {
      event.target.submit();
    }, delay);
  }

  toggleLoading() {
    this.loadingTarget.classList.toggle("d-none");
  }
}
