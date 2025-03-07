import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bird-modal"
export default class extends Controller {
  static values = {
    title: String,
    description: String,
    start: String,
    end: String
  }

  static targets = ["modal", "title", "description", "date"];

  connect() {
    console.log("booking modal connected");
    console.log(this.wrapperTarget);
    console.log(this.titleValue);
  }

  toggle() {
    this.modalTarget.classList.remove("d-none");
    console.log(this.titleValue);
    this.titleTarget.innerText = this.titleValue;
    this.descriptionTarget.innerText = this.descriptionValue;
    this.dateTarget.innerText = `from: ${this.startValue} until: ${this.endValue}`;
  }

  close() {
    console.log("close modal");
    console.log(this.modalTarget);
    console.log(this.wrapperTarget);
    this.modalTarget.classList.toggle("d-none");
    this.wrapperTarget.classList.toggle("d-none");
  }
}
