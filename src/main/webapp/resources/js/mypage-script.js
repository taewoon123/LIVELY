//숨긴 div 보기

function showD() {
  var box2 = document.querySelector('.scrapbox2');
  box2.style.display = "flex";
  box2.style.flexWrap = "nowrap";
}

var state = 0;

function showD() {
  var box2 = document.querySelector('.scrapbox2');
  var box3 = document.querySelector('.scrapbox3');

  if(state === 0){
    box2.style.display = "flex";
    box2.style.flexWrap = "nowrap";
    state = 1;
  }else {
    box3.style.display = "flex";
    box3.style.flexWrap = "nowrap";
  }
}

// 프로필 사진 업로드(사진 누르면 사진 선택 창 나옴)
const upload = document.querySelector(".imgPro");
const noneinput = document.querySelector(".profileimg");

upload.addEventListener("click",() => noneinput.click());

function previewImage(event) {
  var reader = new FileReader();
  reader.onload = function() {
    var preview = document.querySelector(".imgPro");
    preview.src = reader.result;
    preview.style.display = 'block';
  }
  reader.readAsDataURL(event.target.files[0]);
}