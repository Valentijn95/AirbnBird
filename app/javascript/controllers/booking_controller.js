import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {

  static targets = ['status']

  connect() {
    if (this.statusTarget.innerText == "pending") {
      this.statusTarget.classList.add("pending-status");
    } else if (this.statusTarget.innerText == "accepted") {
      this.statusTarget.classList.add("accepted-status");
    } else {
      this.statusTarget.classList.add("denied-status");
    }
  }
}
