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

				<!-- 작성 버튼 -->
				<button id="write_submit_delete" onclick = "location.href = '${rootContext}/notice/delete?num=${vo.noticeNo}'">
					<span>삭제하기</span>
				</button>

				<button id="write_submit_edit" onclick="toggleActive();">
					<span>수정하기</span>
				</button>
				
				<!-- edit 코드인데 실패... -->
				<div id = "form-area">
					<form action = "${rootContext}/notice/edit" method = "post">
						<input type = hidden" name = "noticeNo" value = "${vo.noticeNo}">
						<div id = "notice-area">
						<div>제목</div>
							<div>
								<input type="text" name="noticeTitle" value="${vo.noticeTitle}">
							</div>
							<div>작성일자</div>
							<div>${vo.enrollDate}</div>
							<div>조회수</div>
							<div>${vo.views}</div>
							<div>내용</div>
							<div>
								<textarea name="noticeContent">${vo.noticeContent}</textarea>
							</div>
						</div>
						<br> 
						<button id="write_submit_edit"><span>수정하기</span></button>
					</form>
				</div> 

			</div> <!-- div view-area active end -->

		
		<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	
		</main>
		
	</div> <!-- div wrap end -->

</body>
</html>
<!-- edit js -->
<script>

    function toggleActive(){
        const viewArea = document.querySelector(".view-area");
        const formArea = document.querySelector(".form-area");

        viewArea.classList.remove('active');
        formArea.classList.add('active');
    }
    
</script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/notice/notice-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>