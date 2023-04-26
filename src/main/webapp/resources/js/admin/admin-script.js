const checkboxAll = document.querySelector("#check-all");

checkboxAll.addEventListener("click",checkAll);

function checkAll() {
  let checkboxes = document.querySelectorAll("input[type='checkbox']");

  for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = checkboxes[i].checked === false;
  }

}
