<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

	<h2>Notice</h2>

	<!-- list table -->
	<div id="wrap">

		<main>
		
			<!-- search button -->
			<div class="container-input">
				<input type="text" placeholder="Search" name="text" class="input">
				<svg fill="#000000" width="20px" height="20px"
					viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg">
    				<path
						d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
						fill-rule="evenodd">
					</path>
				</svg>
			</div>

			<br> <br> <br>

			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>작성일시</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items = "${nvoList}" var = "nvo">
						<tr>
							<td>${nvo.noticeNo}</td>
							<td>${nvo.noticeTitle}</td>
							<td>${nvo.enrollDate}</td>
							<td>${nvo.views}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 작성 버튼 -->
			<c:if test="${adminLog.adminId == 'admin'}">
			<button id="write_submit">
				<span> 
					<a class="write-btn" href="${rootContext}/notice/write">write</a>
				</span>
			</button>			
			</c:if>

			<!-- pagenation -->
			<div class="page-area">
				<div class="pagination-custom">
				<c:if test="${pv.currentPage > 1}">
					<a class = "prev page-numbers" href = "${rootContext}/notice/list?page=${pv.currentPage-1}"> << </a>
				</c:if>
				<c:forEach begin = "${pv.startPage}" end = "${pv.endPage}" step = "1" var = "i">
					<c:if test = "${pv.currentPage != i}">
						<a class = "page-numbers" href = "${rootContext}/notice/list?page=${i}">${i}</a>
					</c:if>
					<c:if test = "${pv.currentPage == i}">
						<a class = "page-numbers">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test = "${pv.currentPage < pv.maxPage}">
					<a class = "next page-numbers" href = "${rootContext}/notice/list?page=${pv.currentPage+1}"> >> </a>
				</c:if>
				</div> <!-- div pagination-custom -->
			</div> <!-- div page-area end -->
		
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>

		</main>
		
	</div> <!-- div wrap end -->

	
</body>
<link rel="stylesheet" href="${rootContext}/resources/css/board/notice/notice-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
</html>
<script>
const table = document.querySelector("main table tbody");
table.addEventListener("click", function(event){
	const num = event.target.parentNode.children[0].innerText; //해당 글 번호를 불러올수있음
	location.href = '${rootContext}/notice/detail?num=' + num;
});
</script>