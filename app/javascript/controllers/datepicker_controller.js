import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    const bookedDates = this.#getBookedDates()
    flatpickr(this.element, {
      mode: "range",
      dateFormat: "Y-m-d",
      disable: bookedDates.map((date) => {
        return { from: date[0], to: date[1] }
      })
    })
  }

  #getBookedDates() {
    return JSON.parse(document.getElementById("booking-dates").value)
  }
}
