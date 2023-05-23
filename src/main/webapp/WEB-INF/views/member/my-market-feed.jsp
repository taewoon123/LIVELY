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

            <div id="market_title">
                <h2>My Market</h2>
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

			<c:forEach items="${myMarketList}" var="myList">
	            <!-- 첫번째 피드 시작 -->
	            <div class="feed_box">
	                <div id="profile_area">
	                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
	                    <div id="profile_box">
	                        <div id="profile_name">김본전</div>
	                        <div id="profile_nick">라이블리</div>
	                    </div>
	                    <div class="drop-edit-delete-area">
					      <a class="drop-edit-delete-box"> 
					        ·&nbsp;&nbsp;&nbsp;·&nbsp;&nbsp;&nbsp;·
					      </a>
					      <div class="dropdown-edit-delete">
					        <a href="${rootContext}/market/edit">수정</a>
					        <a href="${rootContext}/market/delete?no=${marketVo.marketNo}">삭제</a>
					    </div>
					    </div>
	                </div>
	                <div id="feed-image">
	                    <div id="img_area">
	                    <!-- Image Slider -->
	                    <div id="myCarousel${mList.marketNo}" class="carousel slide">
	                        <div class="carousel-indicators">
	                        <button type="button" data-bs-target="#myCarousel${myList.marketNo}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                        <button type="button" data-bs-target="#myCarousel${myList.marketNo}" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                        <button type="button" data-bs-target="#myCarousel${myList.marketNo}" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                        </div>
	                        <div class="carousel-inner">
	                        <div class="carousel-item active">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
	                            <image class="first" href="${rootContext}/resources/img/one${myList.marketNo}.jpg" width="100%" height="100%"/>
	                            </svg>
	                        </div>
	                        <div class="carousel-item">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
	                            <image class="second" href="${rootContext}/resources/img/two${myList.marketNo}.jpg" width="100%" height="100%"/>
	                            </svg>
	                        </div>
	                        <div class="carousel-item">
	                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
	                            <image class="third" href="${rootContext}/resources/img/three${myList.marketNo}.jpg" width="100%" height="100%">
	                            </svg>
	
	                        </div>
	                        </div>
	                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${myList.marketNo}" data-bs-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Previous</span>
	                        </button>
	                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${myList.marketNo}" data-bs-slide="next">
	                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Next</span>
	                        </button>
	                    </div>
	                </div>
	                
	                </div>
	                <div id="content_area">
	                	<h7>${myList.title} &nbsp;&nbsp; ￦ ${myList.price}</h7> <br>
	                    <span class="feed-content">${myList.content}</span>
	                    <span class="feed-content-hide"></span>
	                    <button class="feed-content-more-button">more</button>
	                </div>
	                <div id="chat_area">
	                <!-- 거래중일때는 채팅 목록 버튼 ??? -->
		                    <div class="checkbox-wrapper-8">
							  <input type="checkbox" id="cb3-8" class="tgl tgl-skewed">
							  <label for="cb3-8" data-tg-on="거래완료" data-tg-off="거래중" class="tgl-btn"></label>
							</div>
	                </div>
	            </div>
	            <!-- 첫번째 피드 끝 -->
            </c:forEach>

        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>
 <script src="${rootContext}/resources/js/member/my-market-feed.js"></script>
 <link rel="stylesheet" href="${rootContext}/resources/css/member/my-feed.css">
</html>

<script>
	const toggle = document.querySelector(".drop-edit-delete-box");
	const dropdown = document.querySelector(".drop-edit-delete-area");

	dropdown.addEventListener("click", () => {
		dropdown.classList.toggle("dropdown_toggle");
	});
	
	
	const toggle_text = document.querySelector(".toggle_text");
	/* const checkbox = document.querySelector(".checkbox"); */
	const page_switch = document.querySelector(".toggle_checkbox");
	
	window.onload = function(){
		page_switch.onclick = go;
	}
	
	function go(){
		toggle_text.addEventListener("click",() => {
			location.href='${rootContext}/member/my-friend-feed';
			/* page_switch.checked = false; */
			/* toggle-text.classList.remove("layer"); */
			/* toggle_text.classList.remove("knobs");
			toggle_text.classList.add("layer"); */
		});
	}
	
	function toggle(){
		page_switch_checked = true;
	}
	
	toggle();
	
</script>