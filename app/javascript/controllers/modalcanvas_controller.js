import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modalframe', 'date', 'price', 'description', 'title', 'image', 'deletebutton', 'updatebutton', 'deletebuttonvalue'];

  connect() {
  }

  fill(title, description, s_date, e_date, img, id) {
    console.log(img);
    this.imageTarget.style.backgroundImage = `url('${img}')`;
    this.modalframeTarget.style.display = '';
    this.titleTarget.innerText = title;
    this.descriptionTarget.innerText = description;
    this.dateTarget.innerText = `from: ${s_date} to: ${e_date}`;
    this.priceTarget.classList.add("d-none");
    this.deletebuttonTarget.setAttribute("action", `/bookings/${id}`);
    this.deletebuttonvalueTarget.value = "Cancel booking";
    this.deletebuttonvalueTarget.attributes[1].value = "Do you really want to cancel this booking?";
    this.updatebuttonTarget.classList.add("d-none");

  }

  fillBird(title, description, button_value, price, img, id) {
    // prepare
    this.modalframeTarget.classList.remove("d-none");
    this.priceTarget.classList.remove("d-none");
    this.updatebuttonTarget.classList.remove("d-none");

    //fill values
    this.imageTarget.src = img;
    this.titleTarget.innerText = title;
    this.descriptionTarget.innerText = description;
    this.priceTarget.innerText = `$${price}`;
    this.deletebuttonTarget.setAttribute("action", `/birds/${id}`);
    this.deletebuttonvalueTarget.value = button_value
    this.deletebuttonvalueTarget.attributes[1].value = "Do you really want to delete this bird?";
    this.updatebuttonTarget.setAttribute("action", `/birds/${id}/edit`);
  }

  close() {
    this.modalframeTarget.style.display = 'none';
  }
}
