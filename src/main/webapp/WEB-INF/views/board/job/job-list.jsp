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

	<h2>Job/Recruit</h2>

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

   <!-- list table -->
   <div id="wrap">

      <main>
         
         <br>
         <br>
         <br>

         <table>
         
            <thead>
               <tr>
                  <th>No</th>
                  <th>구인/구직</th>
                  <th>Title</th>
                  <th>작성일시</th>
                  <th>작성자</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
             <tr>
                  <td>23</td>
                  <td>23</td>
                  <td>23</td>
                  <td>23</td>
                  <td>23</td>
                  <td>23</td>
               </tr> 
               </tr>
            <c:forEach items="${jobList}" var="job">
               <tr>
                  <td>${job.job_no}</td>
                  <td>${job.job_choice_code}</td>
                  <td>${job.title}</td>
                  <td>${job.enroll_date}</td>
                  <td>${job.writer}</td>
                  <td>${job.views}</td>
               </tr>
              
              </c:forEach>
               

            </tbody>

         </table>
         
         <!-- 작성 버튼 -->
         <button id = "write_submit">
            <span>
               <a class = "write-btn" href="${rootContext}/job/write">write</a>
            </span>
         </button>
         
   
		   <!-- pagenation -->
		   <div class="page-area">
		      <div class="pagination-custom">
		         <a class="prev page-numbers" href="list"> << </a>
		            <span aria-current="page" class="page-numbers current">1</span>
		            <a class="page-numbers" href="list">2</a>
		            <a class="page-numbers" href="list">3</a>
		            <a class="page-numbers" href="list">4</a>
		            <a class="page-numbers" href="list">5</a>
		            <a class="page-numbers" href="list">6</a>
		            <a class="page-numbers" href="list">7</a>
		            <a class="page-numbers" href="list">8</a>
		            <a class="page-numbers" href="list">9</a>
		            <a class="page-numbers" href="list">10</a>
		            <a class="next page-numbers" href="list"> >> </a>
		      </div>
		   </div>

      </main>
   </div>
   
   <footer>
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </footer>
</body>
</html> 
    <link rel="stylesheet" href="${rootContext}/resources/css/board/job/job-list.css">
    <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>