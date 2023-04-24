<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 상세페이지 css */
h5 {
 color: lightskyblue;
}

#notice-area {
	width: 600px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(2, 100px 200px);
	grid-template-rows: 30px 30px 250px;
}

#notice-area > div:not (:nth-child(2), :last-child ) {
	text-align: center;
}

#notice-area > div:nth-child(2), #notice-area > div:last-child {
	grid-column: span 3;
}

#notice-area > div {
	border: 1px solid lightblue;
}

#notice-area input, #notice-area textarea {
	width: 100%;
	height: 100%;
	resize: none;
}

.view-area {
	display: none;
	color: white;
	margin-top: 15%;
	margin-bottom: 5%;
}

.form-area {
	display: none;
}

.active {
	display: block;
}

/* 버튼 css */
#write_submit {
	outline: none;
	cursor: pointer;
	border: none;
	padding: 0.9rem 2rem;
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	position: relative;
	display: inline-block;
	letter-spacing: 0.05rem;
	font-weight: 700;
	font-size: 17px;
	border-radius: 500px;
	overflow: hidden;
	background: #66ff66;
	color: ghostwhite;
	float: right;
	margin-right: 20%;
	margin-top: 2%;
}

#write_submit span {
	position: relative;
	z-index: 10;
	transition: color 0.4s;
}

#write_submit:hover span {
	color: black;
}

#write_submit::before, #write_submit::after {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 0;
}

#write_submit::before {
	content: "";
	background: #000;
	width: 120%;
	left: -10%;
	transform: skew(30deg);
	transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
}

#write_submit:hover::before {
	transform: translate3d(100%, 0, 0);
}

/* search btn css */
.container-input {
  position: relative;
}

.input {
  width: 150px;
  padding: 10px 0px 10px 40px;
  border-radius: 9999px;
  border: solid 1px #333;
  transition: all .2s ease-in-out;
  outline: none;
  opacity: 0.8;
  float : right;
  margin-right: 20%
}

.container-input svg {
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translate(0, -50%);
}

.input:focus {
  opacity: 1;
  width: 250px;
}

</style>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

	<div id="wrap">
		<main>

			<br>

			<div class="view-area active">
				<div id="notice-area">
					<div>제목</div>
					<div>공지사항1</div>
					<div>작성일자</div>
					<div>2023-04-24</div>
					<div>조회수</div>
					<div>1</div>
					<div>내용</div>
					<div>월요병이 점점 심해지고있습니다. 주의하시기 바랍니다.</div>
				</div>
				
				<!-- 작성 버튼 -->
				<button id = "write_submit">
					<span>삭제하기</span>
				</button>
				
				<button id = "write_submit">
					<span>수정하기</span>
				</button>
				
			</div>

			<div class="form-area">
				<form action="${root}/notice/edit" method="POST">
					<input type="hidden" name="no" value="${vo.no}">
					<div id="notice-area">
						<div>제목</div>
						<div>
							<input type="text" name="title" value="${vo.title}">
						</div>
						<div>작성일자</div>
						<div>${vo.enrollDate}</div>
						<div>조회수</div>
						<div>${vo.hit}</div>
						<div>내용</div>
						<div>
							<textarea name="content">${vo.content}</textarea>
						</div>
					</div>
					<br> <input type="submit" value="수정하기">
				</form>
			</div>

		</main>
	</div>
	
	<div id="comment">
			<div id="comment-count">
				댓글 <span id="count">0</span>
			</div>
			<input id="comment-input" name= comment placeholder="댓글을 입력해 주세요.">
			<button id="submit" name = comment>등록</button>
		</div>
	<div id=comments></div>
	
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>
<script>

const inputBar = document.querySelector("#comment-input");
const rootDiv = document.querySelector("#comments");
const btn = document.querySelector("#submit");
const mainCommentCount = document.querySelector('#count'); //맨위 댓글 숫자 세는거.

//타임스템프 만들기
function generateTime(){
    const date = new Date();
    const year = date.getFullYear();
    const month = date.getMonth();
    const wDate = date.getDate();
    const hour = date.getHours();
    const min = date.getMinutes();
    const sec = date.getSeconds();

    const time = year+'-'+month+'-'+wDate+' '+hour+':'+min+':'+sec;
    return time;

}

//유저이름 발생기
//유저이름은 8글자로 제한.
function generateUserName(){
    let alphabet = 'abcdefghijklmnopqrstuvwxyz';
    var makeUsername = '';
    for(let i=0; i<4;i++){
        let index = Math.floor(Math.random(10) * alphabet.length);
        makeUsername += alphabet[index];        
    }
    for(let j=0;j<4;j++){
        makeUsername += "*";
    }
    return makeUsername;    
}

function numberCount(event){
    console.log(event.target);
    if(event.target === voteUp){
        console.log("2");
      return voteUp.innerHTML++; 
      
    }else if(event.target === voteDown){
      return voteDown.innerHTML++; 
    }   
    
}
//신고버튼(delete) 누르면 신고창
function deleteComments(event){    
    const btn = event.target;    
    const list = btn.parentNode.parentNode;//commentList

const reportBtns = document.querySelectorAll('.deleteComment');
reportBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    window.location.href = 'report.html';
  });
});
    //메인댓글 카운트 줄이기.
    if(mainCommentCount.innerHTML <='0'){
        mainCommentCount.innerHTML = 0;
    }else{
        mainCommentCount.innerHTML--;
    }
}

//댓글보여주기
function showComment(comment){
    const userName = document.createElement('div');
    const inputValue = document.createElement('span');
    const showTime = document.createElement('div');
    const voteDiv = document.createElement('div');
    const countSpan = document.createElement('span')
    const voteUp = document.createElement('button');
    const voteDown = document.createElement('button');  
    const commentList = document.createElement('div');  //이놈이 스코프 밖으로 나가는 순간 하나지우면 다 지워지고 입력하면 리스트 다불러옴.
    //삭제버튼 만들기
    const delBtn = document.createElement('button');
    delBtn.className ="deleteComment";
    delBtn.innerHTML="report";
    commentList.className = "eachComment";
    userName.className="name";
    inputValue.className="inputValue";
    showTime.className="time";
    voteDiv.className="voteDiv";
    //유저네임가져오기 
    userName.innerHTML = generateUserName();    
    userName.appendChild(delBtn);  
    //입력값 넘기기
    inputValue.innerText = comment;
    //타임스템프찍기
    showTime.innerHTML = generateTime();
    countSpan.innerHTML=0;
    //투표창 만들기, css먼저 입혀야함.  
    voteUp.id = "voteUp";
    voteUp.innerHTML = '↑';    
    voteDown.id = "voteDown";
    voteDown.innerHTML = '↓';       
    voteDiv.appendChild(voteUp);
    voteDiv.appendChild(voteDown);

    //댓글뿌려주기       
    commentList.appendChild(userName);
    commentList.appendChild(inputValue);
    commentList.appendChild(showTime);
 
    rootDiv.prepend(commentList);

    voteUp.addEventListener("click",numberCount);
    voteDown.addEventListener("click",numberCount);
    delBtn.addEventListener("click",deleteComments);
   console.dir(rootDiv);

}

//버튼만들기+입력값 전달
function pressBtn(){ 
   const currentVal = inputBar.value;
   
   if(!currentVal.length){
      alert("댓글을 입력해주세요");
   }else{
      showComment(currentVal);  
      mainCommentCount.innerHTML++;
      inputBar.value ='';
   }
}

btn.onclick = pressBtn;


//버튼만들기+입력값 전달
function pressBtn(){ 
   const currentVal = inputBar.value;
   
   if(!currentVal.length){
      alert("댓글을 입력해주세요!!");
   }else{
      showComment(currentVal);  
      mainCommentCount.innerHTML++;
      inputBar.value ='';
   }
}

btn.onclick = pressBtn;
</script>