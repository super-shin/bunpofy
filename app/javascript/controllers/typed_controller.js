import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  static targets = ["output"];

  connect() {
    const options = {
      strings: ["NINJA-FUN!", "NINJA-EXCITING!", "NINJA-CHALLENGING!", "NINJA-ENGAGING!", "NINJA-DELIGHTFUL!", "NINJA-AMUSING!"],
      typeSpeed: 100,
      backSpeed: 75,
      backDelay: 1000,
      startDelay: 1000,
      smartBackspace: true,
      loop: true
    };

    new Typed(this.outputTarget, options);
  }
}