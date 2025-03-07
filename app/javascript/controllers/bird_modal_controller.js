import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bird-modal"
export default class extends Controller {

  static values = {
    title: String,
    description: String,
    price: Number,
    img: String,
    id: Number,
    deleteButton: String
  }

  static outlets = ["modalcanvas"];

  connect() {
  }

  toggle() {
    this.modalcanvasOutlets[0].fillBird(this.titleValue, this.descriptionValue, this.deleteButtonValue, this.priceValue, this.imgValue, this.idValue);
  }
}
