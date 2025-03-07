import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-modal"
export default class extends Controller {

  static values = {
    title: String,
    description: String,
    start: String,
    end: String,
    img: String,
    id: Number
  }

  static outlets = ["modalcanvas"];

  connect() {
  }

  toggle() {
    this.modalcanvasOutlets[0].fill(this.titleValue, this.descriptionValue, this.startValue, this.endValue, this.imgValue, this.idValue);
  }
}
