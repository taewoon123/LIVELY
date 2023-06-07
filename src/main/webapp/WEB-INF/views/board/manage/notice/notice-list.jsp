<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/alertMsg.jsp"%>
</header>
<body>

	<h2>Notice</h2>

	<!-- list table -->
	<div id="wrap">

		<main>
			<form action="${rootContext}/notice/list" method="get">
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
<script src="${rootContext}/resources/js/board/notice/notice-list.js"></script>
</html>