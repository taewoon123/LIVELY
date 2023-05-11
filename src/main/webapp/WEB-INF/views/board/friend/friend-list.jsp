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

        <main>
            <div id="friend_title">
                <h2>Friend</h2>
            </div>

            <div id="search-upload-area">
                <div id="upload_button">
                    <input placeholder="Search" class="feed_search_input" name="text" type="text">
                    <a class="hidden_button" type="submit" href="">검색</a>
                    <button data-text="Awesome" class="button" onclick="location.href='${rootContext}/friend/write';">
                        <span class="actual-text">&nbsp;UPLOAD&nbsp;</span>
                        <span class="hover-text" aria-hidden="true">&nbsp;UPLOAD&nbsp;</span>
                    </button>
                </div>
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
            <!-- 첫번째 피드 끝 -->
            <%-- <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                </div>
                <div id="feed-image">
                    <div id="img_area">
                    <!-- Image Slider -->
                    <div id="myCarousel2" class="carousel slide">
                        <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#myCarousel2" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#myCarousel2" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                        <div class="carousel-item active">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
                            <image class="first" href="${rootContext}/resources/img/dog2.jpg" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="second" href="${rootContext}/resources/img/bear.png" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="third" href="${rootContext}/resources/img/dog2.jpg" width="100%" height="100%">
                            </svg>

                        </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel2" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel2" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                
                </div>
                <div id="content_area">
                	<h7>[저랑 같이 밥먹을사람구해요!!]</h7><br>
                    <a>같이 밥 먹을 친구 구함.</a>
                </div>
                <div id="chat_area">
                    <button onclick="chat();"><a>CHAT</a></button>
                </div>
            </div>
            <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                </div>
                <div id="feed-image">
                    <div id="img_area">
                    <!-- Image Slider -->
                    <div id="myCarousel3" class="carousel slide">
                        <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel3" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#myCarousel3" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#myCarousel3" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                        <div class="carousel-item active">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
                            <image class="first" href="${rootContext}/resources/img/dog2.jpg" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="second" href="${rootContext}/resources/img/bear.png" width="100%" height="100%"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                            <image class="third" href="${rootContext}/resources/img/dog2.jpg" width="100%" height="100%">
                            </svg>

                        </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel3" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel3" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                
                </div>
                <div id="content_area">
                	<h7>[저랑 같이 밥먹을사람구해요!!]</h7><br>
                    <a>같이 밥 먹을 친구 구함.</a>
                </div>
                <div id="chat_area">
                    <button onclick="chat()"><a>CHAT</a></button>
                </div>
            </div> --%>
        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>

</html>

 <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-list.css">
 <script src="${rootContext}/resources/js/board/friend-list.js"></script>

