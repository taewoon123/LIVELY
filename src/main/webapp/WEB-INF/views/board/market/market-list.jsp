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
        
        	<div id="market_title">
                <h2>Market</h2>
            </div>

            <form action="${rootContext}/market/list" method="get">
	            <div id="search-upload-area">
                    <input type="text" placeholder="Search" name="searchValue" class="feed_search_input">
                </div>      
            </form>
                
                <div id="upload_button">
	                <div id="feed_checkbox">
	            		<input class="feed_checkbox_status" id="statusCheckbox" type="checkbox" onclick="feed_toggle();"><span>&nbsp; 거래가능만 보기</span>
	            	</div>
                    <button data-text="Awesome" class="button" onclick="location.href='${rootContext}/market/write';">
                        <span class="actual-text">&nbsp;UPLOAD&nbsp;</span>
                        <span class="hover-text" aria-hidden="true">&nbsp;UPLOAD&nbsp;</span>
                    </button>
                </div>
            	

			<c:forEach items="${marketList}" var="mList">
	            <!-- 첫번째 피드 시작 -->
	            <div class="feed_box feed_status_${mList.statusYn}">
	                <div id="profile_area">
	                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
	                    <div id="profile_box">
	                        <div id="profile_name">${mList.writerName}</div>
	                        <div id="profile_nick"><%-- ${marketVo.attachCount} --%>${mList.writerId}</div>
	                    </div>
	                    <c:if test="${mList.statusYn == 'N'}">
		                    <div id="feed_status">
		                    	<input class="feed_status_text" value="거래완료" readonly>
		                    </div>
	                    </c:if>
	                </div>
	                <div id="feed-image">
	                    <div id="img_area">
	                    <!-- Image Slider -->
	                    <div id="myCarousel${mList.marketNo}" class="carousel slide">
	                        <div class="carousel-indicators">
	                        <button type="button" data-bs-target="#myCarousel${mList.marketNo}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                        <button type="button" data-bs-target="#myCarousel${mList.marketNo}" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                        <button type="button" data-bs-target="#myCarousel${mList.marketNo}" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                        </div>
	                        <div class="carousel-inner">
	                        <div class="carousel-item active">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
	                            <%-- <image class="first" href="${rootContext}/resources/upload/market/${fileVoList.changeNameList}" width="100%" height="100%"/> --%>
               	                <image class="first" href="${rootContext}/resources/upload/market/${mList.changeName}" alt="${rootContext}/resources/upload/market/${mList.originName}" width="100%" height="100%"/>
	                            
	                            </svg>
	                        </div>
	                        <%-- <div class="carousel-item">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
	                            <image class="second" href="${rootContext}/resources/img/two${mList.marketNo}.jpg" width="100%" height="100%"/>
	                            </svg>
	                        </div>
	                        <div class="carousel-item">
	                            <svg class="bd-placeholder-img" width="100%" height="100%"  aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160">
	                            <image class="third" href="${rootContext}/resources/img/three${mList.marketNo}.jpg" width="100%" height="100%">
	                            </svg>
	
	                        </div> --%>
	                        </div>
	                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${mList.marketNo}" data-bs-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Previous</span>
	                        </button>
	                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${mList.marketNo}" data-bs-slide="next">
	                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Next</span>
	                        </button>
	                    </div>
	                </div>
	                
	                </div>
	                <div id="content_area">
	                	<h7>${mList.title} &nbsp;&nbsp; ￦ ${mList.price}</h7> <br>
	                    <span class="feed-content">${mList.content}</span>
	                    <span class="feed-content-hide"></span>
	                    <button class="feed-content-more-button">more</button>
	                </div>
	                <div id="chat_area">
	                    <button onclick="return chat();"><a>CHAT</a></button>
	                </div>
	            </div>
	            <!-- 첫번째 피드 끝 -->
            </c:forEach>
            
            
            <!-- 무한업로드 (페이지) -->
            <%-- <div id="page-area">
				<c:if test="${pageVo.currentPage > 1}">
					<a class="prevPage" href="${rootContext}/market/list?page=${pageVo.currentPage-1}">이전</a>
				</c:if>
				<c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" step="1" var="i">
					<c:if test="${pageVo.currentPage != i }">
						<a class="btn btn-secondary btn-sm page_button" href="${rootContext}/market/list?page=${i}">${i}</a>
					</c:if>
					<c:if test="${pageVo.currentPage == i }">
						<a class="btn btn-dark btn-sm page_button">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageVo.currentPage < pageVo.maxPage}">
					<a class="nextPage" href="${rootContext}/market/list?page=${pageVo.currentPage+1}">다음</a>
				</c:if>
			</div> --%>

        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>
 <script src="${rootContext}/resources/js/board/market/market-list.js"></script>
 <link rel="stylesheet" href="${rootContext}/resources/css/board/market/market-list.css">
</html>

<!-- <script>

	const svg = document.querySelector(".bd-placeholder-img");
	
	let imageTag;
	let aTag;
	
	<c:forEach items="${marketVo.attachmentList}" var="fileVo">
		//a태그 만들기
		aTag = document.createElement('a');
		aTag.href = "${root}/market/attachment/download?attachmentNo=${fileVo.no}";
	
		//이미지 요소 만들기
		imgTag = document.createElement('img');
		imgTag.setAttribute("src", "${rootContext}/${path}/${fileVo.changeName}");  //imgTag.src = "~"; 와 동일한 코드
		imgTag.setAttribute("alt", "${fileVo.originName}");
		imgTag.setAttribute("width", '100%');
		imgTag.setAttribute("height", '100%');
		
		//a태그 내부에 img 추가하기
		aTag.appendChild(imgTag);
		
		//div 안에 a태그 추가하기
		svg.appendChild(aTag);
	</c:forEach>
</script> -->