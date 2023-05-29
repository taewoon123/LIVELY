<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.view-area {
	display: none;
}

.form-area {
	display: none;
}

.active {
	display: block;
}
</style>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

	<div id="wrap">

		<main>

			<br>

			<div class="view-area active">

				<a href="${rootContext}/qna/list" id="list-btn">목록</a>
				<div id="detail-area">
					<div id="detail-title">제목</div>
					<div id="detail-inTitle">${qvo.qnaTitle}</div>
					<div id="detail-date">작성일자</div>
					<div id="detail-inDate">${qvo.enrollDate}</div>
					<div id="detail-hit">조회수</div>
					<div id="detail-inHit">${qvo.views}</div>
					<div id="detail-content">내용</div>
					<div id="detail-inContent">${qvo.qnaContent}</div>
					
				</div>

				<!-- 작성 버튼 -->
				<%-- 		<c:if test="${memberLog.id eq vo.writer}"> --%>
				<button id="write_submit_delete"
					onclick="location.href='${rootContext}/qna/delete?no=${qnaNo}'">
					<span>삭제하기</span>
				</button>
				<span style="color: whitesmoke">${qnaNo}</span>

				<button id="write_submit_edit">
					<span>수정하기</span>
				</button>
				<%-- 		</c:if> --%>


			</div>
			<!-- div view-area active end -->
			<div id="comment-header">
				<input type="text" name="comment" placeholder="댓글을 입력하세요">
				<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
			</div>
			<div id="comment-area"></div>
		</main>

	</div>
	<!-- div wrap end -->

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>
<!-- edit js -->

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>

<link rel="stylesheet"
	href="${rootContext}/resources/css/board/qna/qna-detail.css">
<link rel="stylesheet"
	href="${rootContext}/resources/css/common/wrap-style.css" />