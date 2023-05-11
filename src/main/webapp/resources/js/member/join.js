/*
DB 생겨야 구현가능해서 일단 주석처리함

//아이디 중복검사

function checkDup() {
  
  //1. 현재 입력된 아이디 준비
  //2. 서버한테 아이디 전달
  //3. 결과를 받아오기 (isDup , notDup)
  //4. 결과에 따라 , 중복 여부를 알려주기
  
  const email = document.querySelector("input[name=email]").value;
  $.ajax({
      url : '/app/member/email-check',
      type : 'POST',
      data : {
          'email' : email
      },
      success : function(data) {
          if (data == 'notDup') {
            alert("사용 가능한 아이디 입니다.");
          } else {
            alert("사용 불가한 아이디 입니다.");
          }
      },
      error : function(e) {
          console.log(e);
      },
    });

} 
*/


//비번 일치 여부 확인 & 유효성 검사
const pwd = document.querySelector("input[name=pwd]");
const pwd2 = document.querySelector("input[name=pwd2]");

//비번 유효성
pwd.addEventListener("blur", () => {
  const pwdCheck = pwd.value;
  const reg = /^(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
  //문자와 특수문자 포함한 6~12자리
  const result = reg.test(pwdCheck);
  const pwdValidity = document.querySelector("#pwd-validity");
  
  if (!result) {
    pwdValidity.innerText = "사용불가";
    pwd.style.border = "2px solid red";
    
  } else {
    pwdValidity.innerText = "사용가능";
    pwd.style.border = "none";
  }
});

//비번 일치 여부
pwd2.addEventListener("blur", () => {
  const pwd2Validity = document.querySelector("#pwd2-validity");
  
  if (pwd.value != pwd2.value) {
    pwd2Validity.innerText = "불일치";
    pwd2.style.border = "2px solid red";
  } else {
    pwd2Validity.innerText = "일치";
    pwd2.style.border = "none";
  }
});



//이메일 형식 유효성 검사
const email = document.querySelector('input[name="email"]');
const emailValidity = document.querySelector("#email-validity");

email.addEventListener("blur", () => {
  const reg = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  const emailCheck = email.value;
  const result = reg.test(emailCheck);
  
  if (!result) {
    emailValidity.innerText = "사용불가";
    email.style.border = "2px solid red";
  } else {
    emailValidity.innerText = "사용가능";
    email.style.border = "none";
  }
});


// birthValue.length가 계속 0이 나와서 적용이 안됨. UI 다 만들고 해결해보겠습니다!
//생년월일 8자리 검사
var birth = document.querySelector("#birth");
var birthValidity = document.querySelector("#birth-validity");

birth.addEventListener("blur", function() {
  var birthValue = birth.value;
  var regex = /^\d{8}$/; // 정규식: 8자리 숫자만 허용
  
  if (!regex.test(birthValue)) {
    birthValidity.innerText = "8글자형식";
    birth.style.border = "2px solid red";
  } else {
    birthValidity.innerText = "";
    birth.style.border = "none";
  }
});

// const birth = document.querySelector("#birth");
// const birthValidity = document.querySelector("#birth-validity");
// const birthValue = birth.value;

// birth.addEventListener("blur",()=>{
//   if(birthValue.length != 8){
//     console.log(birthValue.length);
//     console.log("외않되");
//     birthValidity.c = "8글자형식";
//     birth.style.border = "2px solid red";
//   }else{
//     birthValidity.innerText = "";
//     birth.style.border = "none";
//   }
// });


// 전화번호 형식 유효성 검사
const hp = document.querySelector("#hp");
const hpValidity = document.querySelector("#hp-validity");

hp.addEventListener("blur",()=>{
  const hpValue = hp.value;
  console.log(hpValue); 

  if(hpValue.length < 10 || hpValue.length > 11 || hpValue < 0100000000){
    hpValidity.innerText = "10~11글자형식";
    hp.style.border = "2px solid red";
  }else{
    hpValidity.innerText = "";
    hp.style.border = "none";
  }
});



