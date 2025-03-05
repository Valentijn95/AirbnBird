import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  static targets = ["selector", "input"]

  connect() {
    console.log("Category selector controller connected");
    console.log(this.selectorTarget);
  }

  addCategory() {

    if (this.inputTarget.value === "") {
      this.inputTarget.value += `${this.selectorTarget.value}`;
    } else {
      this.inputTarget.value += `, ${this.selectorTarget.value}`;
    }
  }

}
