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
    let card = document.getElementById(`error-card-${id}`);

    if (card) {
      card.id = cardId; // Set the new ID
      card.classList.toggle('d-none', false); // Make sure card is visible
      cardContainer.appendChild(card);

      card.querySelector('.btn-close').addEventListener('click', () => {
        this.hideCard(cardId);
        this.cardStates.set(cardId, false); // Update the state to hidden
      });
    }
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
