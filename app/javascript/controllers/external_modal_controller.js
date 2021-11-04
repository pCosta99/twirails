import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal"];

  toggle(event){
    this.modalTarget.classList.toggle("hidden");
  }
}
