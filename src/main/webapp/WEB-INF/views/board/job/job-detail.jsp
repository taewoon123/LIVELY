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
		<a href = "${rootContext}/job/list" id = "list-btn">목록</a>
            <div id="detail-area">
               <div id = "detail-title">제목</div>
               <div id = "detail-inTitle">일할실분 구합니다</div>
               <div id = "detail-date">작성일자</div>
               <div id = "detail-inDate">2023-04-24</div>
               <div id = "detail-hit">조회수</div>
               <div id = "detail-inHit">1</div>
               <div id = "detail-content">내용</div>
               <div id = "detail-inContent">강남역에서 일하실분 구합니다.</div>
            </div>
            
            <!-- 작성 버튼 -->
            <button id = "write_submit_delete">
               <span>삭제하기</span>
            </button>
            
            <button id = "write_submit_edit">
               <span>수정하기</span>
            </button>
            
         </div>

   
   <div id="comment">

            <input id="comment-input" name="comment" placeholder="댓글을 입력해 주세요.">
            <button id="submit" name="comment">등록</button>
         </div>

         <!-- js때문에 있어야함. -->
         <div id=comments></div>

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