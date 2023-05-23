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
		<a href = "${rootContext}/job/job-list" id = "list-btn">목록</a>
     
				<div id="notice-area">
					<div id="notice-title">제목</div>
					<div id="notice-inTitle">${jvo.title}</div>
					<div id="notice-date">작성일자</div>
					<div id="notice-inDate">${jvo.enrollDate}</div>
					<div id="notice-hit">조회수</div>
					<div id="notice-inHit">${jvo.views}</div>
					<div id="notice-content">내용</div>
					<div id="notice-inContent">${jvo.content}</div>
				</div>
            <!-- 작성 버튼 -->
            <button id = "write_submit_delete">
               <span>삭제하기</span>
            </button>
            
            <button id = "write_submit_edit">
               <span>수정하기</span>
            </button>
            
            </div>
		<!-- </form> -->
         </div>
   			<div>
				<label for="thumbnail-tag">사진</label>
				<input id="thumbnail-tag" type="file" name="f" multiple accept=".jpg,.png,.jpeg">
			</div>
					<div id="thumbnail-area"></div>
					
					
   		<div id="comment-header">
				<input type="text" name="comment" placeholder="댓글을 입력하세요">
				<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
			</div>
			<div id="comment-area">
         </div>

      </main>

   </div> <!-- div wrap end -->

   <footer>
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
</body>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>

<link rel="stylesheet" href="${rootContext}/resources/css/board/job/job-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />