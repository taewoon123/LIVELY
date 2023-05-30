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
			
			<form action="${rootContext}/friend/list" method="get">
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
		<c:forEach items="${friendList}" var="fList">
            <!-- 첫번째 피드 시작 -->
             <div id="feed_box feed_status_${fList.statusYn}">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/marketimg.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                    <c:if test="${fList.statusYn == 'N'}">
                    <div id="feed_status">
                        <input class="feed_status_text" value="모집마감" readonly/>
                    </div>
                    </c:if>
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
                            <%-- <image class="first" href="${rootContext}/resources/img/first${fList.friendNo}.jpg" width="100%" height="100%"/> --%>
                         	<image class="first" href="${rootContext}/resources/upload/friend/${fList.changeName}" width="100%" height="100%" multiple accept=".jpg,.png,.jpeg"/>
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                         	<image class="second" href="${rootContext}/resources/upload/friend/${fList.changeName}" width="100%" height="100%" multiple accept=".jpg,.png,.jpeg"/> 
                            </svg>
                        </div>
                        <div class="carousel-item">
                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
                   			<image class="third" href="${rootContext}/resources/upload/friend/${fList.changeName}" width="100%" height="100%" multiple accept=".jpg,.png,.jpeg"> 
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
                    <span class="feed-content">${fList.content}</span>
	                <span class="feed-content-hide"></span>
	                <button class="feed-content-more-button">more</button>
                </div>
                <div id="chat_area">
                    <button onclick="chat();"><a>CHAT</a></button>
                </div>
             </div>
		</c:forEach>
		
		<div id="page-area">
				<c:if test="${pageVo.currentPage > 1}">
					<a class="prevPage" href="${rootContext}/friend/list?page=${pageVo.currentPage-1}">이전</a>
				</c:if>
				<c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" step="1" var="i">
					<c:if test="${pageVo.currentPage != i }">
						<a class="btn btn-secondary btn-sm page_button" href="${rootContext}/friend/list?page=${i}">${i}</a>
					</c:if>
					<c:if test="${pageVo.currentPage == i }">
						<a class="btn btn-dark btn-sm page_button">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageVo.currentPage < pageVo.maxPage}">
					<a class="nextPage" href="${rootContext}/friend/list?page=${pageVo.currentPage+1}">다음</a>
				</c:if>
			</div>
		
            
        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>

</html>

<!-- <script>

const div = document.querySelector('#thumbnail-area');

let imgTag;
let aTag;
<c:forEach items="${fvo.attachmentList}" var="fvo">
	//a태그 만들기
	aTag = document.createElement('a');
	aTag.href = "${root}/friend/att/down?ano=${fvo.no}";
	//이미지 요소 만들기
	imgTag = document.createElement('img');
	imgTag.setAttribute("src" , "${root}/${path}/${fvo.changeName}");
	imgTag.setAttribute("alt" , "${fvo.originName}");
	imgTag.setAttribute("width" , "100px");
	imgTag.setAttribute("height" , '100px');

	//a태그 내부에 img 추가
	aTag.appendChild(imgTag);

	//div 안에 a태그 추가
	div.appendChild(aTag);
</c:forEach>

</script> -->

 <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-list.css">
 <script src="${rootContext}/resources/js/board/friend-list.js"></script>
