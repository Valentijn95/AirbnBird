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
    console.log("bird modal connected");
  }

  toggle() {
    console.log(this.modalcanvasOutlets[0]);
    this.modalcanvasOutlets[0].fillBird(this.titleValue, this.descriptionValue, this.deleteButtonValue, this.priceValue, this.imgValue, this.idValue);
  }
}
