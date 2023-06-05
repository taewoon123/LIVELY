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

<h2>Q&A</h2>


   <!-- list table -->
   <div id="wrap">

   <!-- search button -->
   <div class="container-input">
      <input type="text" placeholder="Search" name="text" class="input">
      <svg fill="#000000" width="20px" height="20px" viewBox="0 0 1920 1920"
         xmlns="http://www.w3.org/2000/svg">
          <path
            d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
            fill-rule="evenodd">
         </path>
      </svg>
   </div>
   
      <main>
         <br>
         <br>
         <br>
         <table>
            <thead>
               <tr>
                  <th>No</th>
                  <th>Title</th>
                  <th>작성일시</th>
                  <th>작성자</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
             <c:forEach items = "${qvoList}" var = "qvo">
						<tr>
							<td>${qvo.qnaNo}</td>
							<td>${qvo.qnaTitle}</td>
							<td>${qvo.enrollDate}</td>
							<td>${qvo.writerName}</td>
							<td>${qvo.views}</td>
						</tr>
					</c:forEach>
            </tbody>
         </table>
         <!-- 작성 버튼 -->
         <button id = "write_submit">
            <span>
               <a class = "write-btn" href="${rootContext}/qna/write">write</a>
            </span>
         </button>
   
   <!-- pagenation -->
	   <div id="page-area">
	            <c:if test="${pv.currentPage > 1 }">
	               <a href="${root}/board/qna/list?page=${pv.currentPage - 1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">이전</a>
	            </c:if>
	            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
	               <a href="${root}/board/qna/list?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">${i}</a>
	            </c:forEach>
	            <c:if test="${pv.currentPage < pv.maxPage}">
	               <a href="${root}/board/qna/list?page=${pv.currentPage + 1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">다음</a>
	            </c:if>
	         </div>

         
      </main>
   </div>
   
   <footer>
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
</body>
</html> 
    <link rel="stylesheet" href="${rootContext}/resources/css/board/qna/qna-list.css">
    <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>
<script>
const table = document.querySelector("main table tbody");
table.addEventListener("click", function(event){
	const no = event.target.parentNode.children[0].innerText; //해당 글 번호를 불러올수있음
	location.href = '${rootContext}/qna/detail?no=' + no;
});
</script>