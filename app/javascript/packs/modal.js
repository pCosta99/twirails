export function toggleModal(modal_id){
  console.log("abc");
  el = document.getElementById(modal_id);
  el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
}
