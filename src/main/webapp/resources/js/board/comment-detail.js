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
function deleteComments(event) {    

    //메인댓글 카운트 줄이기.
    if(mainCommentCount.innerHTML <='0'){
        mainCommentCount.innerHTML = 0;
    }else{
        mainCommentCount.innerHTML--;
    }
}

//댓글보여주기
//댓글보여주기
function showComment(comment){
    const userName = document.createElement('div');
    const inputValue = document.createElement('span');
    const showTime = document.createElement('div');
    const voteDiv = document.createElement('div');
    const countSpan = document.createElement('span');
    const voteUp = document.createElement('button');
    const voteDown = document.createElement('button');  
    const commentList = document.createElement('div');
    const editBtn = document.createElement('button'); // 수정 버튼 생성
    const deleteBtn = document.createElement('button'); // 삭제 버튼 생성
    
    commentList.className = "eachComment";
    userName.className="name";
    inputValue.className="inputValue";
    showTime.className="time";
    voteDiv.className="voteDiv";
    editBtn.className = "editBtn"; // 수정 버튼에 CSS 클래스 추가
    deleteBtn.className = "deleteBtn"; // 삭제 버튼에 CSS 클래스 추가

    //유저네임가져오기 
    userName.innerHTML = generateUserName();
    //입력값 넘기기
    inputValue.innerText = comment;
    //타임스템프찍기
    showTime.innerHTML = generateTime();
    countSpan.innerHTML=0;
    
    //수정, 삭제 버튼 추가
    editBtn.innerText = '수정'; // 수정 버튼 텍스트 설정
    deleteBtn.innerText = '삭제'; // 삭제 버튼 텍스트 설정
    commentList.appendChild(editBtn); // 수정 버튼을 댓글 리스트에 추가
    commentList.appendChild(deleteBtn); // 삭제 버튼을 댓글 리스트에 추가

    //댓글뿌려주기       
    commentList.appendChild(userName);
    commentList.appendChild(inputValue);
    commentList.appendChild(showTime);
    /* commentList.appendChild(voteDiv); // 투표창 추가 */

    rootDiv.prepend(commentList);

    voteUp.addEventListener("click",numberCount);
    voteDown.addEventListener("click",numberCount);

    // 수정 버튼 클릭 이벤트 추가
    editBtn.addEventListener('click', () => {
        // 현재 댓글 내용을 텍스트 박스에 넣어주기
        inputBar.value = inputValue.innerText;
        // 댓글 수정 함수 호출
        editComment(commentList, inputValue);
    });

    // 삭제 버튼 클릭 이벤트 추가
    deleteBtn.addEventListener('click', () => {
        // 댓글 삭제 함수 호출
        deleteComment(commentList);
    });
}

function editComment(commentList, inputValue) {
	  const editBtn = commentList.querySelector('.editBtn');
	  const deleteBtn = commentList.querySelector('.deleteBtn');
	  const submitBtn = document.createElement('button'); // 수정 완료 버튼 생성
	  const cancelBtn = document.createElement('button'); // 수정 취소 버튼

	  submitBtn.innerHTML = "수정 완료"; // 버튼 텍스트 추가
	  cancelBtn.innerHTML = "취소"; // 버튼 텍스트 추가

	  // 수정 버튼 클릭 이벤트 리스너
	  editBtn.addEventListener('click', () => {
	    commentList.removeChild(editBtn); // 수정 버튼 제거
	    commentList.removeChild(deleteBtn); // 삭제 버튼 제거

	    // 수정 완료 버튼 이벤트 리스너
	    submitBtn.addEventListener('click', () => {
	      const newComment = document.createElement('span'); // 수정된 내용을 보여줄 span 엘리먼트 생성
	      newComment.innerHTML = inputValue.value; // 수정된 내용으로 업데이트
	      commentList.replaceChild(newComment, inputValue); // 기존 입력창을 수정된 내용으로 교체
	      commentList.removeChild(submitBtn); // 수정 완료 버튼 제거
	      commentList.removeChild(cancelBtn); // 취소 버튼 제거
	      commentList.appendChild(editBtn); // 수정 버튼 추가
	      commentList.appendChild(deleteBtn); // 삭제 버튼 추가
	    });

	    // 취소 버튼 이벤트 리스너
	    cancelBtn.addEventListener('click', () => {
	      commentList.removeChild(inputValue); // 입력창 제거
	      commentList.removeChild(submitBtn); // 수정 완료 버튼 제거
	      commentList.removeChild(cancelBtn); // 취소 버튼 제거
	      commentList.appendChild(editBtn); // 수정 버튼 추가
	      commentList.appendChild(deleteBtn); // 삭제 버튼 추가
	    });

	    commentList.insertBefore(inputValue, commentList.childNodes[1]); // 입력창을 댓글 내용 바로 아래에 추가
	    commentList.appendChild(submitBtn); // 수정 완료 버튼 추가
	    commentList.appendChild(cancelBtn); // 취소 버튼 추가
	  });

	  // 삭제 버튼 클릭 이벤트 리스너
	  deleteBtn.addEventListener('click', () => {
	    commentList.parentNode.removeChild(commentList); // 댓글 삭제
	    if(mainCommentCount.innerHTML <= 0) {
	      mainCommentCount.innerHTML = 0; // 댓글 수가 0보다 작아지지 않도록 보호
	    } else {
	      mainCommentCount.innerHTML--; // 댓글 수 감소
	    }
	  });
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