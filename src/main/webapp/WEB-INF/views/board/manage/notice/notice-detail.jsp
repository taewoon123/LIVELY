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

         <br>

         <div class="view-area active">
            <div id="notice-area">
               <div id = "notice-title">제목</div>
               <div id = "notice-inTitle">공지사항</div>
               <div id = "notice-date">작성일자</div>
               <div id = "notice-inDate">2023-04-24</div>
               <div id = "notice-hit">조회수</div>
               <div id = "notice-inHit">1</div>
               <div id = "notice-content">내용</div>
               <div id = "notice-inContent">lively 공지사항입니다.</div>
            </div>
            
            <!-- 작성 버튼 -->
            <button id = "write_submit_delete">
               <span>삭제하기</span>
            </button>
            
            <button id = "write_submit_edit">
               <span>수정하기</span>
            </button>
            
         </div>

      </main>
   </div>
   
   <footer>
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer> 
</body>
</html>
<link rel="stylesheet" href="${rootContext}/resources/css/board/notice/notice-detail.css">