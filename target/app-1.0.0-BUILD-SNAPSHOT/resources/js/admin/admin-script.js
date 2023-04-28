const memberCheckboxAll = document.querySelector("#member-check-all");

memberCheckboxAll.addEventListener("click",memberCheckAll);

function memberCheckAll(event) {
  memberCheckboxAll.checked = true;
  let memberCheckboxes = document.querySelectorAll(".member-checkbox");

  for (let i = 0; i < memberCheckboxes.length; i++) {
    memberCheckboxes[i].checked = memberCheckboxes[i].checked === false;
    event.currentTarget.checked = memberCheckboxes[i].checked;
  }

}

const someCheckboxAll = document.querySelector("#some-check-all");

someCheckboxAll.addEventListener("click",someCheckAll);

function someCheckAll(event) {
  let someCheckboxes = document.querySelectorAll(".some-checkbox");

  for (let i = 0; i < someCheckboxes.length; i++) {
    someCheckboxes[i].checked = someCheckboxes[i].checked === false;
    event.currentTarget.checked = someCheckboxes[i].checked;
  }

}
