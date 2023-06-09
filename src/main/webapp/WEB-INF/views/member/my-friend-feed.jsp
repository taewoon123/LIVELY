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
                <input placeholder="Search" class="feed_search_input" name="searchValue" type="text">
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
			<c:forEach items="${fvoMap}" var="fvo">
	            <!-- 첫번째 피드 시작 -->
	            <div class="feed_box feed_status_${fvo.statusYn}">
	            	<input type="text" class="friendNo" value="${fvo.friendNo}" style="display: none">
	            	<input type="text" class="statusYn" value="${fvo.statusYn}" style="display: none">
	                <div id="profile_area">
	                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
	                    <div id="profile_box">
	                        <div id="profile_name">${fvo.writerName}</div>
	                        <div id="profile_nick">${fvo.locationName}</div>
	                    </div>
	                    <div class="drop-edit-delete-area">
							<a class="drop-edit-delete-box"> 
								·&nbsp;&nbsp;&nbsp;·&nbsp;&nbsp;&nbsp;·
							</a>
							<div class="dropdown-edit-delete">
								<a href="${rootContext}/friend/edit/${fvo.friendNo}"><div>수정</div></a>
								<a href="${rootContext}/friend/delete/${fvo.friendNo}"><div>삭제</div></a>
							</div>
					    </div>
	                </div>
	                <div id="feed-image">
	                    <div id="img_area">
	                    <!-- Image Slider -->
	                    <div id="myCarousel${fvo.friendNo}" class="carousel slide">
	                        <div class="carousel-inner">
	                    <c:forEach items="${fvo.attachmentList}" var="att">
	                        <div class="carousel-item active">
	                            <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" viewBox="0 0 3840 2160" >
               	                <image class="first" href="${rootContext}/resources/upload/friend/${att.changeName}"  width="100%" height="100%"/>
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
	                    </div>
						</div>
	                </div>
	                
	                <div id="content_area">
						<h7>${fvo.title} &nbsp;&nbsp;</h7> <br>
						<div class="content-line">
		                    <span class="feed-content">${fvo.content}</span>
		                    <span class="feed-content-hide"></span>
		                    <button class="feed-content-more-button">more</button>
	                    </div>
	                </div>
	                <div id="chat_area">
						<!-- 거래중일때는 채팅 목록 버튼 ??? -->
						<div class="checkbox-wrapper-8">
							<input type="checkbox" id="cb3-8" class="tgl tgl-skewed temp">
							<label for="cb3-8" data-tg-on="모집완료" data-tg-off="모집중" class="tgl-btn status${fvo.statusYn}"></label>
						</div>
	                </div>
				</div>
	            
	            <!-- 첫번째 피드 끝 -->
            </c:forEach>

        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>
<%--  <script src="${rootContext}/resources/js/member/my-friend-feed.js"></script> --%>
 <link rel="stylesheet" href="${rootContext}/resources/css/member/my-feed.css">
</html>

<script>
//friend / market 페이지 전환
const toggle_text = document.querySelector(".toggle_text");
const toggle_checkbox = document.querySelector("#button-3");

const page_switch = document.querySelector(".toggle_checkbox");

page_switch.checked = false;

function go(){
	page_switch.addEventListener("click",() => {
		location.href='/lively/member/my-market-feed';
	});
}

go();

/* 거래중/거래완료 에 따라 버튼 고정 */
const friendNoElements = document.querySelectorAll(".friendNo");
const statusYnElements = document.querySelectorAll(".statusYn");
const friend_status = document.querySelector("#cb3-8");
const label = document.querySelector('label[for="cb3-8"]');

if (statusYnElements.length > 0) {
    const statusYn = statusYnElements[0].getAttribute("value");

    if (statusYn === 'Y') {
        friend_status.checked = false;
    } else if (statusYn === 'N') {
        friend_status.checked = true;
    }
}


/* 거래중/거래완료 버튼 누르면 디비 정보 변경 */

const friend_status_all = document.querySelectorAll("#cb3-8");
function status() {
	friend_status_all.forEach((element, index) => {
		element.addEventListener('click', function() {
			if (element.checked === false) {
				location.href = '/lively/friend/statusY/' + friendNoElements[0].value;
			} else if(element.checked === true) {
				location.href = '/lively/friend/statusN/' + friendNoElements[0].value;
			}
		});
	});
}

status();



//피드 내용

const more_button = document.querySelectorAll('#content_area .feed-content-more-button');
const feed_contents = document.querySelectorAll('#content_area .feed-content');
const feed_hide_contents = document.querySelectorAll('#content_area .feed-content-hide');
const feed_box = document.querySelectorAll('.feed_box');
const content_area = document.querySelector("#content_area");


//피드 내용 - 더보기 / 숨기기 버튼 활성화
function show_more_hide_button(event, slice_length){
    const hide_content = event.target.previousElementSibling;  //previousElementSibling : 동등한 관계의 이전 태그
    const origin_content = hide_content.previousElementSibling;
    if(event.target.innerHTML === 'more'){
        origin_content.innerHTML += hide_content.innerHTML;
        event.target.innerHTML = 'hide';
        feed_box.classList.remove('feed_box');
        feed_box.classList.add('feed_more_box');
        content_area.classList.add('feed_content_more_box');
    }else{
        origin_content.innerHTML = origin_content.innerHTML.slice(0, slice_length);
        event.target.innerHTML = 'more';
        feed_box.classList.remove('feed_more_box');
        feed_box.classList.add('feed_box');
        content_area.classList.remove('feed_content_more_box');
    }
}

//피드 내용 - 더보기 / 숨기기
function hide_feed_content(){
  const slice_length = 50;
  feed_contents.forEach((content, index) => {
      if(content.innerHTML.length > slice_length){
          feed_hide_contents[index].innerHTML = `${content.innerHTML.slice(slice_length)}`;
          content.innerHTML = content.innerHTML.slice(0, slice_length);
          more_button[index].classList.remove('more-button-invisible');
          more_button[index].addEventListener("click", (event) => {
              show_more_hide_button(event, slice_length);
          });
      }else more_button[index].classList.add('more-button-invisible');
  });
}

hide_feed_content();

//거래 완료 시 투명도 낮게

function feed_done() {
  var feedBoxes = document.getElementsByClassName("feed_box");

  for (var i = 0; i < feedBoxes.length; i++) {
      var feedBox = feedBoxes[i];
      if (feedBox.classList.contains("feed_status_N")) {
          feedBox.classList.add("feed_done");
      } 
  }
}

feed_done();


//수정 / 삭제 버튼
const toggle = document.querySelectorAll("#profile_area .drop-edit-delete-box");
const dropdown = document.querySelectorAll("#profile_area .drop-edit-delete-area");

function editDelete(){
	toggle.forEach((element, index) => {
		element.addEventListener("click", () => {
			dropdown[index].classList.toggle("dropdown_toggle");
		});
	});
}

editDelete();





</script>

