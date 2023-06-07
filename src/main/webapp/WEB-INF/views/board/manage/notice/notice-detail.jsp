<%@ page language="java"
	pageEncoding="UTF-8"%>
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

	<div id="wrap">

		<main>

			<br>

			<div class="view-area active">
			
			<a href="${rootContext}/notice/list" id="list-btn">목록</a>
				<div id="notice-area">
               		<div id="notice-title">제목</div>
               		<div id="notice-inTitle">${vo.noticeTitle}</div>
               		<div id="notice-date">작성일자</div>
               		<div id="notice-inDate">${vo.enrollDate}</div>
               		<div id="notice-hit">조회수</div>
               		<div id="notice-inHit">${vo.views}</div>
               		<div id="notice-content">내용</div>
               		<div id="notice-inContent">${vo.noticeContent}</div>
            	</div>

				<c:if test="${adminLog.adminId eq 'admin'}">
				<div id="notice-btn-area">
					<button id="write_submit_delete" onclick="location.href='${rootContext}/notice/delete?num=${vo.noticeNo}'"><span>삭제하기</span></button>
					<button id="write_submit_edit" onclick="toggleActive();"><span>수정하기</span></button>
				</div>
				</c:if>
			</div>

			<div class="form-area">
				<form action="${rootContext}/notice/edit" method="POST" enctype="multipart/form-data">
					<input type = "hidden" name = "noticeNo" value = "${vo.noticeNo}">
					<div id="notice-area">
						<div id="notice-title">제목</div>
						<div>
							<input id="notice-inTitle" type="text" name="noticeTitle" value="${vo.noticeTitle}">
						</div>
						<div id="notice-date">작성일자</div>
						<div id="notice-inDate">${vo.enrollDate}</div>
						<div id="notice-hit">조회수</div>
						<div id="notice-inHit">${vo.views}</div>
						<div id="notice-content">내용</div>
						<div>
							<textarea id="notice-inContent" name="noticeContent">${vo.noticeContent}</textarea>
						</div>
					</div>
					<br> <button id="write_submit_edit" style = "margin-right: 240px;"><span>수정하기</span></button>
				</form>
			</div>
			
			<footer>
      			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
      		</footer>

		</main>
	</div>

</body>
<link rel="stylesheet" href="${rootContext}/resources/css/board/notice/notice-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>
<script src="${rootContext}/resources/js/board/notice/notice-detail.js"></script>
</html>