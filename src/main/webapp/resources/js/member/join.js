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
const password = document.querySelector("input[name=password]");
const password2 = document.querySelector("input[name=password2]");

//비번 유효성
password.addEventListener("blur", () => {
  const passwordCheck = password.value;
  const reg = /^(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
  //문자와 특수문자 포함한 6~12자리
  const result = reg.test(passwordCheck);
  const passwordValidity = document.querySelector("#password-validity");
  
  if (!result) {
    passwordValidity.innerText = "사용불가";
    password.style.border = "2px solid red";
    
  } else {
    passwordValidity.innerText = "사용가능";
    password.style.border = "none";
  }
});

//비번 일치 여부
password2.addEventListener("blur", () => {
  const passwordCheckValidity = document.querySelector("#passwordCheck-validity");
  
  if (password.value != password2.value) {
    passwordCheckValidity.innerText = "불일치";
    password2.style.border = "2px solid red";
  } else {
    passwordCheckValidity.innerText = "일치";
    password2.style.border = "none";
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
const birth = document.querySelector("#birth");
const birthValidity = document.querySelector("#birth-validity");
const birthValue = birth.value;

birth.addEventListener("blur",()=>{
  if(birthValue.length != 8){
    console.log(birthValue.length);
    console.log("외않되");
    birthValidity.innerText = "8글자형식";
    birth.style.border = "2px solid red";
  }else{
    birthValidity.innerText = "";
    birth.style.border = "none";
  }
});



// 전화번호 형식 유효성 검사
const phone = document.querySelector("#phone");
const hpValidity = document.querySelector("#hp-validity");

phone.addEventListener("blur",()=>{
  const phoneValue = phone.value;
  console.log(phoneValue); 

  if(phoneValue.length < 10 || phoneValue.length > 11 || phoneValue < 0100000000){
    hpValidity.innerText = "10~11글자형식";
    phone.style.border = "2px solid red";
  }else{
    hpValidity.innerText = "";
    phone.style.border = "none";
  }
});


>>>>>>> main
