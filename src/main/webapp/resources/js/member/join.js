//var joinTest = false;

//아이디 중복검사
function checkDup() {
  
  //1. 현재 입력된 아이디 준비
  //2. 서버한테 아이디 전달
  //3. 결과를 받아오기 (isDup , notDup)
  //4. 결과에 따라 , 중복 여부를 알려주기
  
  const idTag = document.querySelector("input[name=id]");
  const id = document.querySelector("input[name=id]");
  const idValidity = document.querySelector('#id-validity');
    
    $.ajax({
        url : '/lively/member/id-check',
        type : 'POST',
        data : {
            'id' : id.value
        },
        success : function(data) {
            if (data == 'notDup') {
              idValidity.innerText = "";
              idTag.style.border = "none";
            } else {
              idValidity.innerText = "ID중복";
              idTag.style.border = "2px solid red";
              id.value = " ";
            }
        },
        error : function(e) {
            alert("통신 실패");
            console.log(e);
        },
      });

} 

//비번 일치 여부 확인 & 유효성 검사
const pwd = document.querySelector("input[name=pwd]");
const pwd2 = document.querySelector("input[name=pwd2]");

//비번 유효성
pwd.addEventListener("blur", () => {
  const pwdCheck = pwd.value;
  const reg = /^(?=.*[A-Za-z])(?=.*[~!@#$%^&*()_+])[A-Za-z\d~!@#$%^&*()_+]{6,12}$/;
  //문자,특수문자 포함한 6~12자리
  const result = reg.test(pwdCheck);
  const pwdValidity = document.querySelector("#pwd-validity");
  
  if (!result) {
    pwdValidity.innerText = "사용불가";
    pwd.style.border = "2px solid red";
    pwd.value = "";
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
    pwd2.value = "";
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
  const result = reg.test(email.value);
  
  if (!result) {
    emailValidity.innerText = "사용불가";
    email.style.border = "2px solid red";
  } else {
    emailValidity.innerText = "사용가능";
    email.style.border = "none";
  }
});


// type을 data로 바꿔서 js 필요없음. (나중에 필요할 수 도 있으니 코드 그대로 둠)
//생년월일 8자리 검사

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
 const hpRegex = /^\d$/;
 if(hp.value.length >= 10 && hp.value.length <= 11 && hp.value >= 0100000000){
   hpValidity.innerText = "";
   hp.style.border = "none";
 }else{
   hpValidity.innerText = "10~11글자형식";
   hp.style.border = "2px solid red";
   hp.value = "";
 }
});

// //성별선택 필수
// const female = document.querySelector('#female').checked;
// const male = document.querySelector('#male').checked;
// const genderCodeValidity = document.querySelector('#genderCode-validity');

// if(!female && !male){
//   genderCodeValidity.innerText = "선택필요";
// }else{
//   genderCodeValidity.innerText = "";
// }

// //지역선택 필수
// const location = document.querySelector('#location').value;
// const locationValidity = document.querySelector('#location-validity');

// if(location === "Select"){
//  locationValidity.innerText = "선택필요";
// }else{
//  locationValidity.innerText = "";
// }

