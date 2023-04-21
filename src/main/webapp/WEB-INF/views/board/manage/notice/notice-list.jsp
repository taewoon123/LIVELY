<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div id = "wrap">
      
      <%@ include file = "/WEB-INF/views/common/header.jsp" %>
      
      <main>
         <h2 align = "center">공지사항 목록</h2>
         
         <table>
            <thead>
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성일시</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
            
               <c:forEach items = "${nvoList}" var = "nvo"> <!-- 반복문이 돌아가면서 모든 nvolist가 nvo로 반복(?) -->
                  <tr>
                     <td>${nvo.no}</td>
                     <td>${nvo.title}</td>
                     <td>${nvo.enrollDate}</td>
                     <td>${nvo.hit}</td>
                  </tr>
               </c:forEach>
               
            </tbody>
         </table>
         
         <!-- 조건식 : 아이디가 관리자일때만 글쓰기 버튼이 생기고, 관리자가 아닐 시 글쓰기 버튼 사라짐 -->
         <c:if test = "${loginMember.id == 'ADMIN'}">
            <div id = "write-btn-area">
               <a id = "write-btn" class = "btn btn-info" href = "${root}/notice/write">글쓰기</a>         
            </div>         
         </c:if>
         
      </main>
      
   </div>
</body>
</html>

<!-- css가 위에있으면 최상단경로인 ${root} 경로가 안나오기때문에 css적응이 안됨. 따라서 맨아래에 작성함. -->
<link rel = "stylesheet" href = "${root}/resources/css/notice/list.css">

<script>

   const table = document.querySelector("main table tbody");
   table.addEventListener("click", function(event){
      const num = event.target.parentNode.children[0].innerText; //해당 글 번호를 불러올수있음
      location.href = '${root}/notice/detail?num=' + num;
   });
   
</script>