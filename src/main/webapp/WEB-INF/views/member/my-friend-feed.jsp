<%@ page language="java"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my-feed</title>
</head>

<body>

    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

        <main>
        
        	<form action="${rootContext}/member/my-friend-feed" method="get">

            <div id="market_title">
                <h2>My Friend</h2>
            </div>

            <div id="search-upload-area">
                <input placeholder="Search" class="feed_search_input" name="text" type="text">
                <a class="hidden_button" type="submit" href="">검색</a>
                
                
					<div class="toggle-button-cover">
				        <div id="button-3" class="button r">
				          <input class="toggle_checkbox" type="checkbox">
				          <div class="toggle_text knobs"></div>
				          <div class="toggle_text layer"></div>
				        </div>
				      </div>
            	
            </div>
            </form>
			<c:forEach items="${myFriendList}" var="myList">
	            <!-- 첫번째 피드 시작 -->
	            <div class="feed_box feed_status_${myList.statusYn}">
	            	<input type="text" class="friendNo" value="${myList.friendNo}" style="display: none">
	            	<input type="text" class="statusYn" value="${myList.statusYn}" style="display: none">
	                <div id="profile_area">
	                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
	                    <div id="profile_box">
	                        <div id="profile_name">${myList.writerName}</div>
	                        <div id="profile_nick">${myList.writerId}</div>
	                    </div>
	                    <div class="drop-edit-delete-area">
							<a class="drop-edit-delete-box"> 
								·&nbsp;&nbsp;&nbsp;·&nbsp;&nbsp;&nbsp;·
							</a>
							<div class="dropdown-edit-delete">
								<a href="${rootContext}/friend/edit/${myList.friendNo}"><div>수정</div></a>
								<a href="${rootContext}/friend/delete/${myList.friendNo}"><div>삭제</div></a>
							</div>
					    </div>
	                </div>
	                <div id="feed-image">
	                    <div id="img_area">
	                    <!-- Image Slider -->
	                    <div id="myCarousel${myList.friendNo}" class="carousel slide">
	                        <div class="carousel-inner">
	                        <div class="carousel-item active">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
               	                <image class="first" href="${rootContext}/resources/upload/friend/${myList.changeName}"  width="100%" height="100%"/>
	                            </svg>
	                        </div>
	                 
	                        </div>
	                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${myList.friendNo}" data-bs-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Previous</span>
	                        </button>
	                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${myList.friendNo}" data-bs-slide="next">
	                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Next</span>
	                        </button>
	                    </div>
						</div>
	                </div>
	                
	                <div id="content_area">
						<h7>${myList.title} &nbsp;&nbsp;</h7> <br>
						<div class="content-line">
		                    <span class="feed-content">${myList.content}</span>
		                    <span class="feed-content-hide"></span>
		                    <button class="feed-content-more-button">more</button>
	                    </div>
	                </div>
	                <div id="chat_area">
						<!-- 거래중일때는 채팅 목록 버튼 ??? -->
						<div class="checkbox-wrapper-8">
							<input type="checkbox" id="cb3-8" class="tgl tgl-skewed temp">
							<label for="cb3-8" data-tg-on="모집완료" data-tg-off="모집중" class="tgl-btn status${myList.statusYn}"></label>
						</div>
	                </div>
				</div>
	            
	            <!-- 첫번째 피드 끝 -->
            </c:forEach>

        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>
 <script src="${rootContext}/resources/js/member/my-friend-feed.js"></script>
 <link rel="stylesheet" href="${rootContext}/resources/css/member/my-feed.css">
</html>

