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


//모집완료시 투명도 낮게

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





// 채팅
function chat(){

	let options = "width=500, height=600, top=100,left=500";
    window.open("/lively/chat", "chat", options);

}

/*//검색기능
const search_button = document.querySelector(".feed_search_input");
search_button.addEventListener("keydown",(event) => {
    if(event.keyCode == 13){
        event.preventDefault();
        document.querySelector('.hidden_button').click();
    }
});*/
/*const feed_search_input = document.querySelector(".feed_search_input");
feed_search_input.addEventListener("keydown",(event) => {
	  
	const actualTarget = event.target.parentNode.childNodes[1].innerText;
	if(event.keyCode == 13){
		location.href = "/lively/friend/list?no=${actualTarget}"
		
	}
});*/
/*//변수 준비
const searchTypeTag = document.querySelector('select[name="searchType"]');
const svInput = document.querySelector('input[name="searchValue"]');
const svSelect = document.querySelector('select[name="searchValue"]');

//서치타입 초기값 셋팅
function initSearchType (){
    const optionTag = document.querySelector('option[value="${searchMap.searchType}"]');
    if(optionTag != null){
        optionTag.selected = true;
    }
}*/

/*//서치밸류 형태 변경
function toggleSearchValueTag(){
    if(searchTypeTag.value != 'LocationNo'){
        showNotLocationNo();
    }else{
        showLocationNo();
    }
}

//서치밸류 형태1
function showNotLocationNo(){
    //인풋 태그가 보이게
    svInput.classList.remove('hide');
    svInput.name = 'LocationNo';
    svSelect.classList.add('hide');
    svSelect.name = 'xxx';
    
    svInput.value = '';
}

//서치밸류 형태2
function showLocationNo(){
    //셀렉트태그가 보이게
    svInput.classList.add('hide');
    svInput.name = 'xxx';
    svSelect.classList.remove('hide');
    svSelect.name = 'LocationNo';
}

//서치밸류 형태 초기셋팅
function initSearchValueType(){
    if('${searchMap.searchType}' == 'LocationNo'){
        showLocationNo();
    }else{
        showNotLocationNo();
    }
}
*/
//서치밸류 selected 셋팅
/*function initSearchValueSelected(){
    const optionTag = document.querySelector('option[value="${searchMap.searchValue}"]');
    if(optionTag != null){
        optionTag.selected = true;
    }
}

//input태그 (서치밸류) 값 초기 셋팅
function initSearchValueInput(){
    console.log(svInput);
    svInput.value = '${searchMap.searchValue}';
}

initSearchValueSelected();
initSearchType();
initSearchValueType();
initSearchValueInput();

//이벤트 리스너 //서치밸류 형태 변경하는 이벤트 등록
searchTypeTag.addEventListener('change' , toggleSearchValueTag);
*/
