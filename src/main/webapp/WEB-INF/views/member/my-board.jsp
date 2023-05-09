  <%@ page language="java" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>내가 올린 글</title>
  </head>
  <header>
     <%@ include file="/WEB-INF/views/common/header.jsp"%>
  </header>
  <body>
  
     <h2>MY BOARD</h2>
  
     <!-- list table -->
     <div id="wrap">
        <main>
        
           <!-- search button -->
           <div class="container-input">
              <input type="text" placeholder="Search" name="text" class="input">
              <svg fill="#000000" width="20px" height="20px"
                 viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
                    fill-rule="evenodd">
                 </path>
              </svg>
           </div>
  
           <br> <br> <br>
  
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
                <tr id="first-tr" onclick="location.href='${rootContext}/query/detail'">
                  <td>1</td>
                  <td>회원정보 수정</td>
                  <td>2023.05.24</td>
                  <td>me</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>친구찾기</td>
                  <td>2023.04.24</td>
                  <td>me</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>배고픈데</td>
                  <td>2023.04.24</td>
                  <td>me</td>
                  <td>9</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>담미온ㄱ?</td>
                  <td>2023.10.24</td>
                  <td>me</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>떡두유 그만먹고싶다</td>
                  <td>2023.04.24</td>
                  <td>me</td>
                  <td>4</td>
                </tr>
              </tbody>
           </table>
  
           <!-- pagenation -->
           <div class="page-area">
              <div class="pagination-custom">
                 <a class="prev page-numbers" href="my-board"> 
                  << </a> 
                    <span aria-current="page" class="page-numbers current">1</span> 
                    <a class="page-numbers" href="my-board">2</a>
                    <a class="page-numbers" href="my-board">3</a> 
                    <a class="page-numbers" href="my-board">4</a> 
                    <a class="page-numbers" href="my-board">5</a> 
                    <a class="page-numbers" href="my-board">6</a> 
                    <a class="page-numbers" href="my-board">7</a> 
                    <a class="page-numbers" href="my-board">8</a> 
                    <a class="page-numbers" href="my-board">9</a> 
                    <a class="page-numbers" href="my-board">10</a> 
                    <a class="next page-numbers" href="my-board"> >> </a>
              </div>
           </div> <!-- div page-area end -->
        
        </main>
     </div> <!-- div wrap end -->
  
     <footer>
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
     </footer>
     
  </body>
  </html>
  <link rel="stylesheet" href="${rootContext}/resources/css/member/notice-list.css">
  <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
  <script src="${rootContext}/resources/js/query/query-list.js"></script>