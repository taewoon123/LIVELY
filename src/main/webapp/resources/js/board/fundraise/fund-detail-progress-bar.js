// 프로그래스 업데이트 
// moneyGoal 과 currentMoney에 따라 달라짐
let preMoneyGoal = document.querySelector('.money-goal-target').innerText;
let preCurrentMoney = document.querySelector('.current-money-target').innerText;
let splitedMoneyGoal = preMoneyGoal.split("₩");
let splitedCurrentMoney = preCurrentMoney.split("₩");

let moneyGoal = splitedMoneyGoal[1];
let currentMoney = splitedCurrentMoney[1];
let calculatedProgress = (currentMoney / moneyGoal) * 100;


function setProgress(progress) {
  const progressBar = document.querySelector('.progress');
  progressBar.style.width = calculatedProgress + '%';
}
//프로그래스 설정
setProgress(calculatedProgress);
