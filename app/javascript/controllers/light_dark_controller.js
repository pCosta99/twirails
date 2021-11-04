import { Controller } from "stimulus";

export default class extends Controller {
  static get targets() {
    return ["toggle", "twirails"];
  }

  toggle(event){
    console.log(this.twirailsTarget)
    if(document.cookies != null){
      this.toggleTarget.textContent = '☀️'
      document.cookies = null
      document.documentElement.classList.remove("dark");
      document.documentElement.classList.remove("bg-black");
      this.twirailsTarget.classList.remove("text-white");
      this.twirailsTarget.classList.add("text-black");
    } else {
      this.toggleTarget.textContent = '🌙'
      document.cookies = "theme=dark"
      document.documentElement.classList.add("dark");
      document.documentElement.classList.add("bg-black");
    }
  }

  warn(event){
    console.log(this.twirailsTarget)
    alert("oui")
  }
}
