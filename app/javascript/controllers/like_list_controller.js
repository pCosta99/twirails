import { Controller } from "stimulus";

export default class extends Controller {
  static get targets() {
    return ["like_list"];
  }

  delete(){
    console.log("delete");
  }

  insert(){
    console.log("insert");
  }
}
