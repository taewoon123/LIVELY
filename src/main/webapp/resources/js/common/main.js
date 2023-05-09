// 하단 고정
function TOP(){
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}


const fixedButton = document.getElementById("fixedButton");
let lastScrollTop = 0;
window.addEventListener("scroll", () => {
  const currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;
  if (currentScrollTop > lastScrollTop) {
    // 스크롤을 내릴 때: top 버튼을 보이게 함
    fixedButton.style.bottom = "80px";
  } else {
    // 스크롤을 올릴 때
    if (currentScrollTop === 0) {
      // 페이지 맨 위에 있을 때: top 버튼을 숨김
      fixedButton.style.bottom = "-100px";
    } else {
      // 페이지 맨 위가 아닐 때: top 버튼을 보이게 함
      fixedButton.style.bottom = "80px";
    }
  }
  lastScrollTop = currentScrollTop;
});