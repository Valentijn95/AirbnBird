import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: Array,
  }

  connect() {
    flatpickr(this.element, {
      mode: "range",
      dateFormat: "Y-m-d",
      disable: this.datesValue.map((date) => {
        return { from: date[0], to: date[1] }
      })
    })
  }
}
