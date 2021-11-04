import { Controller } from "stimulus";

export default class extends Controller {
  static get targets() {
    return ["count", "heart", "list"];
  }

  toggle(event){
    if(this.heartTarget.attributes.fill.value == "none"){
      // Increment the like count
      const value = parseInt(this.countTarget.innerText)
      this.countTarget.innerText = value+1
      // Update the heart svg fill status
      this.heartTarget.setAttribute("fill", "red")
    } else {
      // Decrement the like count
      const value = parseInt(this.countTarget.innerText)
      this.countTarget.innerText = value-1
      // Update the heart svg fill status
      this.heartTarget.setAttribute("fill", "none")
    }
  }
}
