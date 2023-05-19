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
            <div id="friend_title">
                <h2>Friend</h2>
            </div>
			
			<form action="${rootContext}/friend/friend-list" method="get">
	            <div id="search-upload-area">
	                <!-- <div class="selections">
	                    <select class="location-option" name="locationNo" id="location" required>
	                        <option value="0" selected>지역선택</option>
	                        <option value="1">강동구</option>
	                        <option value="2">강서구</option>
	                        <option value="3">강남구</option>
	                        <option value="4">강북구</option>
	                    </select>
	                </div> -->
                    <input placeholder="Search" class="feed_search_input" name="searchValue" type="text" value="${searchMap.searchValue}">
                            <c:forEach items="${fvoList}" var="fvo">
                                <option value="${fvo.NO}">${fvo.NAME}</option> 
                            </c:forEach> 
                         <a class="hidden_button" type="submit" name="searchValue" href="">검색</a> 
                      	<!-- <button class="hidden_button" type="submit" name="searchValue">검색</button> -->
                </div>      
            </form>
	                <div id="upload_button">
	                    <button data-text="Awesome" class="button" onclick="location.href='${rootContext}/friend/write';">
	                        <span class="actual-text">&nbsp;UPLOAD&nbsp;</span>
	                        <span class="hover-text" aria-hidden="true">&nbsp;UPLOAD&nbsp;</span>
	                    </button>
	                </div>
		<c:forEach items="${friendList}" var="fList">
            <!-- 첫번째 피드 시작 -->
            <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                    <div id="friend_end_box">
                        <input id="friend_end" type="text" value="모집마감" disabled/>
                    </div>
                </div>
                <div id="feed-image">
                    <div id="img_area">
                    <!-- Image Slider -->
                    <div id="myCarousel${fList.friendNo}" class="carousel slide">
                        <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel${fList.friendNo}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#myCarousel${fList.friendNo}" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#myCarousel${fList.friendNo}" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                        <div class="carousel-item active">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
                            <image class="first" href="${rootContext}/resources/img/first${fList.friendNo}.jpg" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="second" href="${rootContext}/resources/img/second${fList.friendNo}.jpg" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="third" href="${rootContext}/resources/img/third${fList.friendNo}.jpg" width="100%" height="100%">
                            </svg>

                        </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${fList.friendNo}" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${fList.friendNo}" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                
                </div>
                <div id="content_area">
                	<h7>${fList.title}</h7><br>
                    <a>${fList.content}</a>
                </div>
                <div id="chat_area">
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

