
//enter 누르면 검색 가능
//const search_button = document.querySelector(".feed_search_input");
//search_button.addEventListener("keydown",(event) => {
//    if(event.keyCode == 13){
//        event.preventDefault();
//        document.querySelector('.hidden_button').click();
//    }
//});


//피드 내용

const more_button = document.querySelectorAll('#content_area .feed-content-more-button');
const feed_contents = document.querySelectorAll('#content_area .feed-content');
const feed_hide_contents = document.querySelectorAll('#content_area .feed-content-hide');
const feed_box = document.querySelector('.feed_box');
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

//거래중만 보기 체크 하면 거래완료 게시판 사라지게

function handleCheckboxChange() {
    var checkbox = document.getElementById("statusCheckbox");
    var feedBoxes = document.getElementsByClassName("feed_box");

    for (var i = 0; i < feedBoxes.length; i++) {
        var feedBox = feedBoxes[i];
        if (checkbox.checked) {
            // Show only 'Y' status feed boxes
            if (feedBox.classList.contains("feed_status_Y")) {
                feedBox.style.display = "block";
            } else {
                feedBox.style.display = "none";
            }
        } else {
            // Show all feed boxes
            feedBox.style.display = "block";
        }
    }
}

var checkbox = document.getElementById("statusCheckbox");
checkbox.addEventListener("change", handleCheckboxChange);



//채팅
function chat(){

	let options = "width=500, height=600, top=100,left=500";
    window.open("/lively/chat", "chat", options);
}

//채팅 버튼 클릭시 마켓 번호 전달
function sendMarketNo(){
	const marketNo = document.querySelector(".hiddenMarketNo").value;
	socket.send(marketNo);
}



//무한스크롤
// function infiniteScroll(){
//     const fullContent = document.querySelector(".feed_box") //피드 전체 둘러싼 div
//     const screenHeight = screen.height; //화면 크기
//     let oneTime = false;
//     document.addEventListener('scroll', onScroll, {passive:true}) //스크롤 이벤트 함수 정의
//         function onScroll(){
//             const fullHeight = fullContent.clientHeight;  //피드 전체의 높이
//             const scrollPosition = pageYOffset; //스크롤위치
//             if(fullHeight - screenHeight / 2 <= scrollPosition && !oneTime){
//                 oneTime = true;
//                 addFeed();
//             }
//         }
// }

// infiniteScroll();

// const pagination = document.querySelector("#page-area");
// const nextLink = pagination.querySelector(".nextPage");
// const nextURL = nextLink.getAttribute("href");  //다음 페이지의 주소 얻어옴

// function addFeed(){
//     const xmlHttpRequest = new XMLHttpRequest();
//     xmlHttpRequest.onreadystatechange = function(){
//         if(xmlHttpRequest.readyState === xmlHttpRequest.DONE){
//             if(xmlHttpRequest.status === 200 || xmlHttpRequest.status === 201){
//                 const nextPageData = xmlHttpRequest.response;
//                 const addList = nextPageData.querySelector(".list");
//                 fullContent.appendChild(addList);
//                 oneTime = false;
//             } else{
//                 console.error(xmlHttpRequest.response);
//             }
//         }
//     };
//     xmlHttpRequest.open("GET", nextURL);
//     xmlHttpRequest.send();
//     xmlHttpRequest.responseType = "document";
// }


