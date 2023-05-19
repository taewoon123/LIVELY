//grab a value of the Number
const tbody = document.querySelector("tbody");
tbody.addEventListener("click", (event) => {
  const actualTarget = event.target.parentNode.childNodes[1].innerText;
  location.href = `/lively/fund/detail?no=${actualTarget}`
});
