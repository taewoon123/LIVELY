<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/member/myPost_comment-style.css">

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
	    </div>
	    <br>
	    <div class="reviewTot">
	        <div class="reviewList">
	            <div class="list Top">
	                <div class="reviewNum tnum"><h5>NO</h5></div>
	                <div class="reviewTitle ttitle"><h5>COMMENT</h5></div>
	                <div class="reviewLike tlike"><h5>LIKE</h5></div>
	                <div class="reviewUnlike tunlike"><h5>UNLIKE</h5></div>
	                <div class="reviewDate tdate"><h5>DATE</h5></div>
	            </div>
	            <div class="list li l20">
	                <div class="reviewNum num n20"><h5>20</h5></div>
	                <div id="reviewTitle title t20"><a href=""><h5>굳굳</h5></a></div>
	                <div class="reviewLike like"><h5>35</h5></div>
	                <div class="reviewUnlike unlike"><h5>3</h5></div>
	                <div class="reviewDate date d20"><h5>2023.03.17</h5></div>
	            </div>
	         </div>
        </div>
    
        <div class="listBox">
            <div class="listButton">
                <div class="listnum leftButton"><a href=""><img src="/resources/img/lessthan.png"></a></div>
                <div class="listnum list1"><a href=""><h5>1</h5></a></div>
                <div class="listnum list2"><a href=""><h5>2</h5></a></div>
                <div class="listnum list3"><a href=""><h5>3</h5></a></div>
                <div class="listnum list4"><a href=""><h5>4</h5></a></div>
                <div class="listnum list5"><a href=""><h5>5</h5></a></div>
                <div class="listnum rightButton"><a href=""><img src="/resources/img/greaterthan_thick.png"></a></div>
            </div>
        </div>
    </div>
 		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
	</div>

</body>
</html>