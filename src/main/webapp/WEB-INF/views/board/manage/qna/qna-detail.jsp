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
					<div id="detail-content">
						내용
						<div id="detail-reply">답변</div>
					</div>
					<div id="detail-inContent">${qvo.qnaContent}
						<div id="detail-inReply">${qvo.qnaReplyContent}</div>
					</div>

				</div>

				<!-- 작성 버튼 -->
				<%-- 		<c:if test="${memberLog.id eq vo.writer}"> --%>
				<button id="write_submit_delete"
					onclick="location.href='${rootContext}/qna/delete?no=${qnaNo}'">
					<span>삭제하기</span>
				</button>

				<button id="write_submit_edit" onclick="toggleActive1();">
					<span>수정하기</span>
				</button>

				<%-- 		</c:if> --%>

				<button id="write_submit_edit" onclick="toggleActive2();">
					<span>답변하기</span>
				</button>



			</div>
			<div class="form-area2">
				<form action="${rootContext}/qna/reply" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" name="qnaNo" value="${qvo.qnaNo}">

					<div id="detail-area">
						<div id="detail-title">제목</div>
						<div id="detail-inTitle">${qvo.qnaTitle}</div>
						<div id="detail-date">작성일자</div>
						<div id="detail-inDate">${qvo.enrollDate}</div>
						<div id="detail-hit">조회수</div>
						<div id="detail-inHit">${qvo.views}</div>
						<div id="detail-content">
							내용
							<div id="detail-reply">답변</div>
						</div>
						<div id="detail-inContent">
							${qvo.qnaContent}
							<div id="detail-inReply">
								<textarea name="qnaReplyContent">${qvo.qnaReplyContent}
							</textarea>
							</div>
						</div>
					</div>

					<br>
					<button id="write_submit_edit" style="margin-right: 240px;">
						<span>답변완료</span>
					</button>
				</form>
			</div>
			<div class="form-area1">
				<form action="${rootContext}/qna/edit" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" name="qnaNo" value="${qvo.qnaNo}">
					<div id="detail-area">
						<div id="detail-title">제목</div>
						<div id="detail-inTitle">
							<textarea name="qnaTitle">${qvo.qnaTitle}</textarea>
						</div>
						<div id="detail-date">작성일자</div>
						<div id="detail-inDate">${qvo.enrollDate}</div>
						<div id="detail-hit">조회수</div>
						<div id="detail-inHit">${qvo.views}</div>
						<div id="detail-content">
							내용
							<div id="detail-reply">답변</div>
						</div>
						<div id="detail-inContent">
							<textarea name="qnaContent">${qvo.qnaContent}</textarea>
							<div id="detail-inReply1">${qvo.qnaReplyContent}</div>
						</div>

					</div>

					<br>
					<button id="write_submit_edit" style="margin-right: 240px;">
						<span>수정완료</span>
					</button>
				</form>
			</div>
		</main>

	</div>
	<!-- div wrap end -->

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>
<!-- edit js -->

<script>
	function toggleActive1() {
		const viewArea = document.querySelector(".view-area");
		const formArea1 = document.querySelector(".form-area1");
		viewArea.classList.remove('active');
		formArea1.classList.add('active');

	}

	function toggleActive2() {
		const viewArea = document.querySelector(".view-area");
		const formArea2 = document.querySelector(".form-area2");
		viewArea.classList.remove('active');
		formArea2.classList.add('active');

	}
</script>

<link rel="stylesheet"
	href="${rootContext}/resources/css/board/qna/qna-detail.css">
<link rel="stylesheet"
	href="${rootContext}/resources/css/common/wrap-style.css" />