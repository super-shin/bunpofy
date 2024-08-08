import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cardContainer", "button"]

  connect() {
    console.log("HELLO FROM CARD SHOW JAVASCRIPT");
    this.cardStates = new Map();
  }

  toggleCard(event) {
    const button = event.currentTarget;
    const id = button.dataset.id;
    const cardId = `card-${id}`;

    if (this.cardStates.has(cardId)) {
      this.cardStates.get(cardId) ? this.hideCard(cardId) : this.showCard(cardId);
    } else {
      this.createCard(id, cardId);
      this.showCard(cardId);
    }

    this.cardStates.set(cardId, !this.cardStates.get(cardId));
  }

  createCard(id, cardId) {
    const cardContainer = this.cardContainerTarget;

    // Create a new card element
    const card = document.createElement('div');
    card.id = cardId;
    card.className = "card embossed border-light d-none mt-3"; // Hide the card initially
    card.innerHTML = `
      <div class="card-body position-relative">
        <button class="btn-close position-absolute top-0 end-0 m-4" aria-label="Close"></button>
        <h5 class="card-title">${id.toUpperCase()} Error</h5>
        <p class="card-text">This is some content inside the card.</p>
        <p>Challenge ID:<%= @submission.challenge_id %></p>
        <p>User ID:<%= @submission.user_id %></p>
        <p>Score:<%= @submission.score %></p>
      </div>
    `;

    cardContainer.appendChild(card);

    card.querySelector('.btn-close').addEventListener('click', () => {
      this.hideCard(cardId);
      this.cardStates.set(cardId, false); // Update the state to hidden
    });
  }

  showCard(cardId) {
    const card = document.getElementById(cardId);
    if (card) {
      card.classList.remove('d-none');
    }
  }

  hideCard(cardId) {
    const card = document.getElementById(cardId);
    if (card) {
      card.classList.add('d-none');
    }
  }
}
