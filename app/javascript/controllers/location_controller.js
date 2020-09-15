import { Controller } from "stimulus";
import places from "places.js";

export default class extends Controller {
  connect() {
    this.initAutocomplete();
  }

  initAutocomplete = () => {
    const locationInput = document.getElementById("product_location");
    if (locationInput) {
      places({ container: locationInput })
    }
  };
}
