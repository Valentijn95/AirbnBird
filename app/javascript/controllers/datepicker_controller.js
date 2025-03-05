import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: String
  }

  connect() {
    console.log(this.datesValue)
    flatpickr(this.element, {
      mode: "range"
    }
  )}
}
