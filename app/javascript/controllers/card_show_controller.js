import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-show"
export default class extends Controller {
  static targets = ["cardContainer"]

  connect() {
    console.log("HELLO FROM CARD SHOW JAVASCRIPT");
  }

  initialize() {
    this.cardVisible = false;
  }

  toggleCard() {
    console.log("CARD GOT CLICKED");
    if (this.cardVisible){
      this.cardContainerTarget.innerHTML = '';
    } else {
    const card = document.createElement('div');
    card.className = "card embossed border-light"
    card.innerHTML = `
      <div class="card-body position-relative">
        <button class="btn-close position-absolute top-0 end-0 m-4" aria-label="Close"></button>
        <h5 class="card-title">Card Title</h5>
        <p class="card-text">This is some content inside the card.</p>
        <p>Challenge ID:<%= @submission.challenge_id %></p>
        <p>User ID:<%= @submission.user_id %></p>
        <p>Score:<%= @submission.score %></p>
      </div>
    `;

    this.cardContainerTarget.appendChild(card);
    card.querySelector('.btn-close').addEventListener('click', () => {
      this.toggleCard();
    })
  }
  this.cardVisible = !this.cardVisible
  }
}
