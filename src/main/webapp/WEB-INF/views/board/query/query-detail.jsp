<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 상세</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
</header>
<body>

	<div id="wrap">
		<main>

			<br>

			<div class="view-area active">
				<a href="${rootContext}/query/list" id="list-btn">목록</a>
				<div id="help-area">
					<div id="help-title">제목</div>
					<div id="help-inTitle">회원정보 수정</div>
					<div id="help-date">작성일자</div>
					<div id="help-inDate">2023-04-24</div>
					<div id="help-hit">조회수</div>
					<div id="help-inHit">1</div>
					<div id="help-content">내용</div>
					<div id="help-inContent">회원정보 수정은 어디서 하나요?</div>
				</div>

				<!-- 작성 버튼 -->
				<button id="write_submit_delete">
					<span>삭제하기</span>
				</button>

				<button id="write_submit_edit">
					<span>수정하기</span>
				</button>

			</div>

			<div id="comment">
				<input id="comment-input" name="comment" placeholder="댓글을 입력해 주세요.">
				<button id="submit" name="comment">등록</button>
			</div>

			<!-- js때문에 있어야함. -->
			<div id="comments"></div>
			
			<footer>
				<%@ include file="/WEB-INF/views/common/footer.jsp"%>
			</footer>
			
		</main>
	</div> <!-- div wrap end -->

</body>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />