<%@ page language="java"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

  	
<body>

	

    <div id="wrap">
    
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

        <main>
			
			<form action="${rootContext}/friend/list" method="get">
			
            <div id="friend_title">
                <h2>Friend</h2>
            </div>
			
	            <div id="search-upload-area">
                    <input type="text" placeholder="Search" name="searchValue" class="feed_search_input">
                </div>      
            </form>
	                <div id="upload_button">
   	                	<div id="feed_checkbox">
	            			<input class="feed_checkbox_status" id="statusCheckbox" type="checkbox" onclick="feed_toggle();"><span>&nbsp; 모집중만 보기</span>
           				</div>
	                    <button data-text="Awesome" class="button" onclick="location.href='${rootContext}/friend/write';">
	                        <span class="actual-text">&nbsp;UPLOAD&nbsp;</span>
	                        <span class="hover-text" aria-hidden="true">&nbsp;UPLOAD&nbsp;</span>
	                    </button>
	                </div>
 		<c:forEach items="${fvoMap}" var="fvo">
			<!--첫번째 피드 시작 -->
             <div class="feed_box feed_status_${fvo.statusYn}"> 
                <div id="profile_area">
                     <div id="profile_img"><img src="${rootContext}/resources/img/marketimg.png" alt="프로필사진"></div> 
                     <div id="profile_box"> 
                         <div id="profile_name">${fvo.writerName}</div> 
                         <div id="profile_nick">${fvo.locationName}</div> 
                     </div> 
                     <c:if test="${fvo.statusYn == 'N'}"> 
                     <div id="feed_status"> 
                         <input class="feed_status_text" value="모집마감" readonly/> 
                     </div> 
                     </c:if> 
                 </div> 
                 <div id="feed-image"> 
                     <div id="img_area">
                    
					<!--Image Slider -->
                     <div id="myCarousel${fvo.friendNo}" class="carousel slide"> 
                         <div class="carousel-inner"> 
                         <c:forEach items="${fvo.attachmentList}" var="att">  
                         <div class="carousel-item active"> 
                             <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" > 
                         		<image class="first" href="${rootContext}/resources/upload/friend/${att.changeName}" width="100%" height="100%" multiple accept=".jpg,.png,.jpeg"/>
                             </svg> 
                         </div> 
                         </c:forEach>  
                         
                        
                         </div> 
                         <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${fvo.friendNo}" data-bs-slide="prev">
                         <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
                        <span class="visually-hidden">Previous</span> 
                        </button> 
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${fvo.friendNo}" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span> 
                        <span class="visually-hidden">Next</span> 
                        </button> 
                 </div><!--Image Slider 끝 -->
                    
                 </div><!--img_area 끝 -->
                
                </div><!-- feed-image 끝 -->
                
                <div id="content_area">
                 	<h7>${fvo.title}</h7><br> 
                 	<div class="content-line">
	                    <span class="feed-content">${fvo.content}</span> 
	 	                <span class="feed-content-hide"></span> 
	 	                <button class="feed-content-more-button">more</button>
 	                </div>
                 </div> 
                 <div id="chat_area"> 
                 <div><br><span class="feedEnrollDate">${fvo.enrollDate}</span></div>
                     <button onclick="chat();"><a>CHAT</a></button> 
                 </div> 
              </div> 
	 	</c:forEach> 
		
            
        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>

</html>


 <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-list.css">
 <script src="${rootContext}/resources/js/board/friend-list.js"></script>
