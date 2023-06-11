  //로그인 한 회원의 locationNo 선택해놓기
  const locationNo = '${memberLog.locationNo}';
  const locationValue = "option[value='" + locationNo + "']";
  document.querySelector(locationValue).selected = true;