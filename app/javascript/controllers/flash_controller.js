import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      const alerts = this.element.querySelectorAll(".alert")

      alerts.forEach((alertNode) => {
        alertNode.classList.remove("show")
        setTimeout(() => alertNode.remove(), 100)
      })
    }, 4000)
  }
}
