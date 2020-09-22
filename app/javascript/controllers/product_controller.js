import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"]
  connect() {
    this.showModalIfErrors();
  }

  showModalIfErrors() {
    const errors = this.modalTarget.querySelector('.invalid-feedback')

    if (errors) {
      $(`#${this.modalTarget.id}`).modal()
    }
  };
}
