import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "step" ]

  connect() {
    this.index = 0
    this.showCurrentStep()
  }

  next() {
    if (this.index < this.stepTargets.length - 1) {
      this.index++
      this.showCurrentStep()
    }
  }

  previous() {
    if (this.index > 0) {
      this.index--
      this.showCurrentStep()
    }
  }

  showCurrentStep() {
    this.stepTargets.forEach((element, i) => {
      if (i === this.index) {
        element.classList.remove("d-none")
      } else {
        element.classList.add("d-none")
      }
    })
  }
}