<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JOIN</title>
</head>

<body>
	<div>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
	</div>

	<div id="wrap">
		<div class="form-container">
			<p class="title">Join</p>

			<form class="form" action="${rootContext}/member/join" method="post">

				<table id="join-form">
					<tbody>

						<tr>
							<td>
								ID
							</td>
							<th>
								<div class="input-group">
									<input type="text" name="id" id="id" placeholder="" onblur="checkDup();" required>
								</div>
							</th>
							<td id="id-validity">

							</td>
						</tr>

						<tr>
							<td>
								Password
							</td>
							<th>
								<div class="input-group">
									<input type="password" name="pwd" id="pwd" placeholder="문자,특수문자 포함 6~12글자" required>
								</div>
							</th>
							<td id="pwd-validity">

							</td>
						</tr>

						<tr>
							<td>
								Password Check
							</td>
							<th>
								<div class="input-group">
									<input type="password" name="pwd2" id="pwd2" placeholder="" required>
								</div>
							</th>
							<td id="pwd2-validity">

							</td>
						</tr>

						<tr>
							<td>
								Name
							</td>
							<th>
								<div class="input-group">
									<input type="text" name="name" id="name" placeholder="" required>
								</div>
							</th>
							<td>

							</td>
						</tr>

						<tr>
							<td>
								E-mail
							</td>
							<th>
								<div class="input-group">
									<input type="email" name="email" id="email" placeholder=" ex) kim@naver.com" required>
								</div>
							</th>
							<td id="email-validity">

							</td>
						</tr>

						<tr>
							<td>
								Birth
							</td>
							<th>
								<div class="input-group">
									<input type="date" name="birth" id="birth" required>
								</div>
							</th>
							<td id="birth-validity">

							</td>
						</tr>

						<tr>
							<td>
								HP
							</td>
							<th>
								<div class="input-group">
									<input type="tel" name="hp" id="hp" placeholder=" ex) 01055550000" required>
								</div>
							</th>
							<td id="hp-validity">

							</td>
						</tr>

						<tr>
							<td>
								Gender
							</td>
							<th>
								<div class="selections">
									<span id="Female">
										<input type="radio" name="genderCode" id="female" value="0" required> <label
											for="female">Female</label>
									</span>
									<span id="Male">
										<input type="radio" name="genderCode" id="male" value="1" required> <label for="male">Male</label>
									</span>
								</div>
							</th>
							<td id="genderCode-validity">

							</td>

						</tr>

						<tr>
							<td>
								Location
							</td>
							<th>
								<div class="selections">
									<select class="location-option" name="locationNo" id="location" required>
										<option value="">Select</option>
										<option value="1">강동구</option>
										<option value="2">강서구</option>
										<option value="3">강남구</option>
										<option value="4">강북구</option>
										<!-- 전국 지역 다 넣으려면 아래 코드 넣어야함 -->
										<!-- <c:forEach items="${locationList}" var="locationList">
											<option value="${locationList.getLocationNo()}">${locationList.getLocationName()}</option>
											</c:forEach> -->
									</select>
								</div>
							</th>
							<td id="location-validity">

							</td>
						</tr>

						<!-- 로봇이 아닙니다 체크 -->
						<tr>
							<td id="robot" colspan="3">
								<script src="https://www.google.com/recaptcha/api.js" async defer></script>
								<script type="text/javascript">
									function onSubmit() {
										console.log('— recaptcha 완료');
									}
								</script>
								<div class="captcha-submit">
									<div id="recaptcha" class="g-recaptcha" data-theme="dark"
										data-sitekey="6LfkiwYlAAAAAC2xzJMPLESbV0ldOSCk7_FX43zq" data-callback="onSubmit"></div>
									<div class="submitbutton">
										<input type="hidden" name="mv_powerbook">
										<!-- <input style="width: 60%;" value="Send" type="submit" id="submit" class="form-submit" /> -->
									</div>
								</div>
						</tr>


						<tr>
							<th colspan="3">
								<input type="submit" id="join-button" value="Join">
							</th>
						</tr>
					</tbody>

				</table>
			</form>

		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
<link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">
<script src="${rootContext}\resources\js\member\join.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">

</html>