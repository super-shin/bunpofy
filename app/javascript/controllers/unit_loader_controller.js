import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="unit-loader"
export default class extends Controller {
  static targets = ['textbookSelect', 'unitSelect'];

  connect() {
    console.log('Unit Select Target:', this.unitSelectTarget);  
    this.unitsByTextbook = JSON.parse(this.element.dataset.unitsByTextbook)
  }

  updateUnits() {
    const textbookId = this.textbookSelectTarget.value

    this.unitSelectTarget.innerHTML = '<option value ="">Select a unit</option>'

    if (textbookId && this.unitsByTextbook[textbookId]) {
      this.unitsByTextbook[textbookId].forEach(unit => {
        const option = document.createElement('option')
        option.value = unit.id
        option.textContent = unit.name
        this.unitSelectTarget.appendChild(option)
      })
    }
  }
}
