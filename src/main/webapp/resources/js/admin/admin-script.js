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





//회원 체크한 요소만 삭제
let deleteList = [];
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
        console.log(deleteList);
      });
}

const deleteMemberButton = document.querySelector("#deleteMemberButton");
deleteMemberButton.addEventListener("click", () => {
  const id = document.querySelector("main input[name=id]").value;
  $.ajax({
    url: '/admin/member-delete',
    type: 'POST',
    contentType: "application/json",
    data: JSON.stringify(deleteList),
    success: function (data) {
    },
    error: function (e) {
      console.log(e);
    },

  });

});
