import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modalframe', 'date', 'description', 'title', 'image', 'form'];

  connect() {
    console.log("modalcanvas connected");
  }

  fill(title, description, s_date, e_date, img, id) {
    console.log(img);
    this.imageTarget.style.backgroundImage = `url('${img}')`;
    this.modalframeTarget.style.display = '';
    this.titleTarget.innerText = title;
    this.descriptionTarget.innerText = description;
    this.dateTarget.innerText = `from: ${s_date} to: ${e_date}`;
    this.formTarget.setAttribute("action", `/bookings/${id}`);
  }

  close() {
    this.modalframeTarget.style.display = 'none';
  }
}
