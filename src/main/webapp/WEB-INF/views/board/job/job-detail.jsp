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

	<div id="wrap">
		<main>

			<div class="view-area active">
				<%-- <form action="${rootContext}/job/job-write" method="POST"> --%>
				<a href="${rootContext}/job/list" id="list-btn">목록</a>

				<div id="detail-area">
					<div id="detail-title">제목</div>
					<div id="detail-inTitle">${jvo.title}</div>
					<div id="detail-date">작성일자</div>
					<div id="detail-inDate">${jvo.enrollDate}</div>
					<div id="detail-hit">조회수</div>
					<div id="detail-inHit">${jvo.views}</div>
					<div id="detail-content">내용</div>
					<div id="detail-inContent">${jvo.content}</div>
				</div>
				<!-- 작성 버튼 -->
				<button id="write_submit_delete">
					<span>삭제하기</span>
				</button>

				<button id="write_submit_edit">
					<span>수정하기</span>
				</button>

			</div>
			<!-- </form> -->
	</div>

	<div id="comment-header">
		<input type="text" name="comment" placeholder="댓글을 입력하세요">
		<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
	</div>
	<div id="comment-area"></div>

	</div>
	</main>

	<!-- div wrap end -->

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>

<link rel="stylesheet"
	href="${rootContext}/resources/css/board/job/job-detail.css">
<link rel="stylesheet"
	href="${rootContext}/resources/css/common/wrap-style.css" />