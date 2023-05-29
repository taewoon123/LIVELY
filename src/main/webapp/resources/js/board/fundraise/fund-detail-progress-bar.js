// 프로그래스 업데이트 
// moneyGoal 과 currentMoney에 따라 달라짐
//let moneyGoal = ParseFloat(document.querySelector('.money-goal-target')).innerText;
//let currentMoney = ParseFloat(document.querySelector('.current-money-target')).innerText;
//let calculatedProgress = (currentMoney / moneyGoal) * 100;
let moneyGoal = parseFloat(document.querySelector('.money-goal-target').innerText);
let currentMoney = parseFloat(document.querySelector('.current-money-target').innerText);
let calculatedProgress = (currentMoney / moneyGoal) * 100;

//TODO: 셋다 NaN
console.log(moneyGoal);
console.log(currentMoney);
console.log(calculatedProgress);
function setProgress(progress) {
  const progressBar = document.querySelector('.progress');
  progressBar.style.width = calculatedProgress + '%';
}
//프로그래스 설정
setProgress(calculatedProgress);



//기부버튼
const donateButton = document.querySelector('.donate');
const donateInput = document.querySelector('.donate-input');
donateButton.addEventListener('click', () => {
   donateButton.addEventListener('click', () => {
      donateButton.classList.add('donate-hide');
   });
});
