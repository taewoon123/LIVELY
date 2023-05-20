const deleteButton = document.querySelector("#write_submit_delete");


deleteButton.addEventListener("click",deleteFund);

function deleteFund(){
  const no = document.querySelector("#fund-no").innerText;

  console.log(no);
  location.href = `/lively/fund/delete?no=${no}`
}
