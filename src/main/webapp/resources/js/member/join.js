
// 전화번호 형식 유효성 검사
document.querySelector("#phone").addEventListener("input", function () {
  var phoneNumber = this.value.replace(/\D/g, '');
  if (phoneNumber.length > 9 && phoneNumber.length <= 11) {
    this.setCustomValidity("");
  } else {
    this.setCustomValidity("올바른 전화번호 형식이 아닙니다");
  }
});

//이메일 형식 유효성 검사
const email = document.querySelector('input[name="email"]');
// const text = document.querySelector("#emailValid h5");

email.addEventListener("blur", () => {
  const reg = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  const emailCheck = email.value;
  const result = reg.test(emailCheck);

  if (result) {
    email.style.border = "2px solid darkgreen";
  } else {
    alert("올바른 형식으로 입력해주세요");
    // text.innerText = "올바른 형식으로 입력해주세요";
    text.style.color = "red";
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
  // const text = document.querySelector("#passwordValid h5");

  if (result) {
    text.innerText = "사용가능합니다";
    text.style.color = "darkgreen";
    password.setCustomValidity("");
  } else {
    text.innerText = "최소 1개의 문자 및 최소 1개의 특수문자 포함한 6~12자리로 입력해주세요";
    text.style.color = "red";
    password.setCustomValidity("올바른 비밀번호 형식이 아닙니다.");
  }
});

//-일치 여부
password2.addEventListener("blur", () => {
  if (password.value == password2.value) {
    password2.style.border = "2px solid darkgreen";
    password2.setCustomValidity("");
  } else {
    password2.style.border = "2px solid red";
    password2.setCustomValidity("비밀번호가 일치하지 않습니다.");
  }
});