import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["preview"]

  previewImage(event) {
    const input = event.target
    const preview = this.previewTarget
  console.log(input.files)
   console.log(preview)
    if (input.files) {
      let reader = new FileReader();

      reader.onload = function(e) {
         preview.insertAdjacentHTML("beforeend", `<div class="thumbnail"> <img class="preview-img" src="${e.target.result}" /> <span class="number">${input.files.length}</span> </div>`)
      }

      Object.keys(input.files).forEach((key) => {
        reader.readAsDataURL(input.files[key]); // convert to base64 string
        reader = new FileReader();
      })

    }
  }
}
