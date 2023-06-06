<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Forgot Password</title>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

			<div id="wrap">
				<div class="form-container">
					<p class="title">비밀번호 재설정</p>

					<form class="form" action="${rootContext}/member/forgot-password" method="post">
						
						<label for="id">ID</label>
						<div class="input-group">
							<input type="text" name="id" id="id">
						</div>

						<label for="name">NAME</label>
						<div class="input-group">
							<input type="text" name="name" id="name">
						</div>

						<label for="birth">BIRTH</label>
						<div class="input-group">
							<input type="date" name="birth" id="birth">
						</div>

						<br>
						<button class="sign-button">정보 입력 완료</button>

					</form>

				</div>
			</div>

			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

<link rel="stylesheet" href="${rootContext}/resources/css/member/login.css">
<script src="${rootContext}/resources/js/member/login.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">

</html>