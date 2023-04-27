<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/member/myPost_post-style.css">

<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
		<div id="preface">
	        <div id="customer-center-text">
	            <h1>나의글</h1>
	        </div>
	    </div>
	<!-- 
	    <div id="front-board">
	    <div class="board-header">
	        <div class="text-header">  
	            <a href="myPost_post.html">
	                <div class="faq-qna-notice" id="post">
	                    <h4>POST</h4>
	                </div>
	            </a> 
	            <a href="myPost_comment.html">
	                <div class="faq-qna-notice" id="comment">
	                    <h4>COMMENT</h4>
	                </div>
	            </a>
	            <a href="myPost_report.html">
	                <div class="faq-qna-notice" id="report">
	                    <h4>REPORT</h4>
	                </div>
	            </a>
	        </div>
	    </div>
	    </div> -->
	    <br>
	    <div class="reviewTot">
	        <div class="reviewList">
	            <div class="list Top">
	                <div class="reviewNum tnum"><h5>NO</h5></div>
	                <div class="reviewTitle ttitle"><h5>TITLE</h5></div>
	                <div class="reviewLike tlike"><h5>HIT</h5></div>
	                <div class="reviewUnlike tunlike"><h5>WRITER</h5></div>
	                <div class="reviewDate tdate"><h5>DATE</h5></div>
	            </div>
	            <c:forEach items="${myPostList}" var="post">
	            <div class="list li l20">
	                <div class="reviewNum num n20"><td>${post.no}</td></div>
	                <div id="reviewTitle title t20"><a href="/post/detail?no=${post.no}"><h5>${post.title}</h5></a></div>
	                <div class="reviewLike like"><h5>${post.hit}</h5></div>
	                <div class="reviewUnlike unlike"><h5>${post.writer}</h5></div>
	                <div class="reviewDate date d20"><h5>${post.enroll_date}</h5></div>
	            </div>`
	            </c:forEach>
	            </div>
			
    			<div id="listBox">
			      <c:if test="${paginationVo.currentPage > 1}">
			        <a href="/post/list?page=${paginationVo.currentPage-1}"><</a>
			      </c:if>
			      <c:forEach var="i" begin="${paginationVo.startPage}" end="${paginationVo.endPage}" step="1">
			        <c:if test="${paginationVo.currentPage == i}">
			          <span>${i}</span>
			        </c:if>
			        <c:if test="${paginationVo.currentPage != i}">
			          <a href="/post/list?page=${i}">${i}</a>
			        </c:if>
			      </c:forEach>
			      <c:if test="${paginationVo.currentPage < paginationVo.maxPage}">
			        <a href="/post/list?page=${paiginationVo.currentPage+1}">></a>
			      </c:if>
			    
		        <div class="searchBox">
		            <div class="searchBottom">
		                <div class="searchList">
		                    <select>
		                        <option>TITLE</option>
		                        <!-- <option>WRITER</option> -->
		                    </select>
		                </div>
		                <div class="searchbot"><input type="text" name="searchbox" placeholder="search"></div>
		                <div id="searchIcon"><a href=""><img src="/resources/img/magnifyer.png"></a></div>
		            </div>
		        </div>
		        </div>
		        
       	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
        
	</div>

</body>
</html>