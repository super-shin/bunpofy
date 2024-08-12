import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="parallax"
export default class extends Controller {
  static targets = ["image"]
  
  connect() {
    // Initial setup or bindings
    this.updateImageSize();
    window.addEventListener("scroll", this.updateImageSize.bind(this));
  }

  disconnect() {
    // Cleanup
    window.removeEventListener("scroll", this.updateImageSize.bind(this));
  }

  updateImageSize() {
    const scrollY = window.scrollY;
    const scaleFactor = 1 + (scrollY / 1000); // Adjust scaling factor as needed
    this.imageTarget.style.transform = `scale(${Math.min(scaleFactor, 3)})`;
    this.imageTarget.style.transformOrigin = "bottom"; // Keep the scaling anchored at the top
  }
}
