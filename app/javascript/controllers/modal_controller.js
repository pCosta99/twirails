import { Controller } from "stimulus";

export default class extends Controller {
  outside(event) {
    if(this.element == event.target
      || this.element.contains(event.target)
      || event.target.id == "likes_button"){
      return;
    }

    const el = document.querySelector('#likes_modal').classList;
    if (!el.contains("hidden")){
      el.add("hidden");
    }
  }
}
