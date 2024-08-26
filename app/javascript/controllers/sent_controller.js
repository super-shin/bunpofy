import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('Hello from the SENT Controller');
    this.element.addEventListener('submit', this.handleSubmit.bind(this))
  }

  handleSubmit(event) {
    const form = this.element.querySelector('form')
    if (form) {
      form.style.display = 'none'
    }
    this.showOverlay()
  }

  showOverlay() {
    this.overlay = document.createElement('div')
    this.overlay.style.position = 'absolute'
    this.overlay.style.top = 0
    this.overlay.style.left = 0
    this.overlay.style.width = '100%'
    this.overlay.style.height = '100%'
    this.overlay.style.backgroundColor = 'rgba(255, 255, 255, 0.7)'
    this.overlay.style.zIndex = '9999'
    this.overlay.style.display = 'flex'
    this.overlay.style.justifyContent = 'center'
    this.overlay.style.alignItems = 'center'
  
    const parentContainer = this.element.closest('.modal-content')
    if (parentContainer) {
      parentContainer.style.position = 'relative'
      parentContainer.appendChild(this.overlay)
    }
  
    setTimeout(() => {
      const gif = document.createElement('img')
      gif.src = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1724650846/papyrus_hpyvds.gif'
      gif.style.width = '600px'
      gif.style.height = '600px'
  
      this.overlay.appendChild(gif)
    }, 500)
  }
}