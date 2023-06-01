const table = document.querySelector("main table tbody");
table.addEventListener("click", function(event){
	const num = event.target.parentNode.children[0].innerText; //해당 글 번호를 불러올수있음
	location.href = '/lively/help/detail?num=' + num;
});