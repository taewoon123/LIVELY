
// 전화번호 형식 유효성 검사
document.querySelector("#phone").addEventListener("input", function () {
  var phoneNumber = this.value.replace(/\D/g, '');
  if (phoneNumber.length > 10 && phoneNumber.length <= 11) {
    this.setCustomValidity("");
  } else {
    this.setCustomValidity("올바른 형식이 아닙니다");
  }
});

//이메일 형식 유효성 검사
const email = document.querySelector('input[name="email"]');
const emailValidity = document.querySelector("#email-validity");

email.addEventListener("blur", () => {
  const reg = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  const emailCheck = email.value;
  const result = reg.test(emailCheck);

  if (result) {
    email.style.border = "2px solid darkgreen";
  } else {
    emailValidity.innerText = "올바르게 입력해주세요";
    emailValidity.style.color = "red";
  }
});


//비번 일치 여부 확인 & 유효성 검사
const password = document.querySelector("input[name=password]");
const password2 = document.querySelector("input[name=password2]");

//-유효성
password.addEventListener("blur", () => {
  const passwordCheck = password.value;
  const reg = /^(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
  //최소 1개의 문자 및 최소 1개의 특수문자 포함한 6~12자리
  const result = reg.test(passwordCheck);
  const passwordValidity = document.querySelector("#password-validity");

  if (result) {
    passwordValidity.innerText = "사용가능";
    password.style.border = "2px solid green";
    passwordValidity.style.color = "green";
    
  } else {
    passwordValidity.innerText = "사용불가능";
    password.style.border = "2px solid red";
    passwordValidity.style.color = "red";
    
  }
});

//-일치 여부
password2.addEventListener("blur", () => {
  const passwordCheckValidity = document.querySelector("#passwordCheck-validity");

  if (password.value == password2.value) {
    password2.style.border = "2px solid green";
    passwordCheckValidity.style.color = "green";
    passwordCheckValidity.innerText="일치";
  } else {
    password2.style.border = "2px solid red";
    passwordCheckValidity.style.color = "red";
    passwordCheckValidity.innerText="불일치";
    }
});