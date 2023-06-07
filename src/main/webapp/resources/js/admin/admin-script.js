const memberCheckboxAll = document.querySelector("#member-check-all");
let deleteList = [];

memberCheckboxAll.addEventListener("click",memberCheckAll);

function memberCheckAll(event) {
  memberCheckboxAll.checked = true;
  let memberCheckboxes = document.querySelectorAll(".member-checkbox");

  for (let i = 0; i < memberCheckboxes.length; i++) {
    memberCheckboxes[i].checked = memberCheckboxes[i].checked === false;
    event.currentTarget.checked = memberCheckboxes[i].checked;
    if (memberCheckboxes[i].checked === true) {
      deleteList.push(memberCheckboxes[i].parentElement.parentElement.children[1].innerText);
    }
  }

}
//putting the members that are checked into an array
const checkBoxes = document.querySelectorAll(".member-checkbox");
  for (let i = 0; i < checkBoxes.length; i++) {
      checkBoxes[i].addEventListener("click", (event) => {
        let target = event.currentTarget;
        let actualTarget = target.parentElement.parentElement.children[1].innerText;
        if (checkBoxes[i].checked === true) {
          deleteList.push(actualTarget);
        }else {
          deleteList.splice(deleteList.indexOf(actualTarget), 1);
        }
      });
}


  //if click on delete button then delete the selected members sending data via ajax
const deleteMemberButton = document.querySelector("#deleteMemberButton");
deleteMemberButton.addEventListener("click", () => {
  $.ajax({
    url: '/lively/admin/member-delete',
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify(deleteList.map((item) => +item)),   // +item converts string to number  
    success: () => {
        location.reload();
    },
    error: (error) => {
      alert("오류가 발생했습니다 ")
      console.log("error : " + error);
    },
  });
});



const someCheckboxAll = document.querySelector("#some-check-all");

someCheckboxAll.addEventListener("click",someCheckAll);

function someCheckAll(event) {
  let someCheckboxes = document.querySelectorAll(".some-checkbox");

  for (let i = 0; i < someCheckboxes.length; i++) {
    someCheckboxes[i].checked = someCheckboxes[i].checked === false;
    event.currentTarget.checked = someCheckboxes[i].checked;
  }
}
