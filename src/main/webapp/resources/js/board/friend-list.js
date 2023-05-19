// 채팅
function chat(){

	let options = "width=500, height=600, top=100,left=500";
    window.open("/lively/chat", "chat", options);

}

//검색기능
const search_button = document.querySelector(".feed_search_input");
search_button.addEventListener("keydown",(event) => {
    if(event.keyCode == 13){
        event.preventDefault();
        document.querySelector('.hidden_button').click();
    }
});
//변수 준비
const searchTypeTag = document.querySelector('select[name="searchType"]');
const svInput = document.querySelector('input[name="searchValue"]');
const svSelect = document.querySelector('select[name="searchValue"]');

//서치타입 초기값 셋팅
function initSearchType (){
    const optionTag = document.querySelector('option[value="${searchMap.searchType}"]');
    if(optionTag != null){
        optionTag.selected = true;
    }
}

//서치밸류 형태 변경
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

//서치밸류 selected 셋팅
function initSearchValueSelected(){
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
