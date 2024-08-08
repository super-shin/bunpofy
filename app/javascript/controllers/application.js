import { Application } from "@hotwired/stimulus"
import "@popperjs/core";
import "bootstrap";


// This code is copied from Bootstrap's docs. See link below.
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
