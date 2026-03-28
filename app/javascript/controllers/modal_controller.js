import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    returnUrl: String,
  }

  connect() {
    const bootstrap = window.bootstrap
    if (!bootstrap || !bootstrap.Modal) return

    this.handleHidden = this.onHidden.bind(this)
    this.modal = new bootstrap.Modal(this.element)
    this.element.addEventListener("hidden.bs.modal", this.handleHidden)
    this.modal.show()
  }

  disconnect() {
    if (this.element && this.handleHidden) {
      this.element.removeEventListener("hidden.bs.modal", this.handleHidden)
    }

    if (this.modal) {
      this.modal.hide()
      this.modal.dispose()
    }
  }

  hide() {
    if (this.modal) this.modal.hide()
  }

  onHidden() {
    if (!this.hasReturnUrlValue || !this.returnUrlValue) return

    if (window.Turbo) {
      window.Turbo.visit(this.returnUrlValue, { action: "replace" })
      return
    }

    window.location.href = this.returnUrlValue
  }
}
