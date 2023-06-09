<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 목록</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/alertMsg.jsp"%>
</header>
<body>
	
	<h2>Query</h2>

	<!-- list table -->
	<div id="wrap">

		<main>
			<form action="${rootContext}/query/list" method="get">
			<!-- search button -->
			<div class="container-input">
				<input type="text" placeholder="Search" name="searchValue" class="input">
			</div>
			</form>
			<br> <br> <br>

			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>작성일시</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>지역</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items = "${qvoList}" var = "qvo">
						<tr>
							<td>${qvo.queryNo}</td>
							<td>${qvo.title}</td>
							<td>${qvo.enrollDate}</td>
							<td>${qvo.writer}</td>
							<td>${qvo.views}</td>
							<td>${qvo.locationName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 작성 버튼 -->
			<c:if test = "${not empty memberLog}">
			<button id="write_submit">
				<span> <a class="write-btn" href="${rootContext}/query/write">write</a>
				</span>
			</button>
			</c:if>

			<!-- pagenation -->
			<div class="page-area">
				<div class="pagination-custom">
				<c:if test="${pv.currentPage > 1}">
					<a class = "prev page-numbers" href = "${rootContext}/query/list?page=${pv.currentPage-1}"> << </a>
				</c:if>
				<c:forEach begin = "${pv.startPage}" end = "${pv.endPage}" step = "1" var = "i">
					<c:if test = "${pv.currentPage != i}">
						<a class = "page-numbers" href = "${rootContext}/query/list?page=${i}">${i}</a>
					</c:if>
					<c:if test = "${pv.currentPage == i}">
						<a class = "page-numbers">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test = "${pv.currentPage < pv.maxPage}">
					<a class = "next page-numbers" href = "${rootContext}/query/list?page=${pv.currentPage+1}"> >> </a>
				</c:if>
				</div> <!-- div pagination-custom -->
			</div> <!-- div page-area end -->
		
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
			
		</main>
		
	</div> <!-- div wrap end -->

</body>
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
<script src="${rootContext}/resources/js/board/query/query-list.js"></script>
</html>