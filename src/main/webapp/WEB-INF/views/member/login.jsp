<%@ page pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>LOGIN</title>
	</head>

	<body>

		<%@ include file="/WEB-INF/views/common/header.jsp" %>

			<div id="wrap">
				<div class="form-container">
					<p class="title">Login</p>

					<form class="form" action="${rootContext}/home" method="post">
						<label for="username">ID</label>
						<div class="input-group">
							<input type="text" name="username" id="username" placeholder="">
						</div>
						<label for="password" id="passwordLabel">Password</label>
						<div class="input-group">
							<input type="password" name="password" id="password" placeholder="">
						</div>
						<br>
						<button class="sign-button">Sign in</button>
					</form>

				</div>
			</div>

			<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	</body>
	<link rel="stylesheet" href="${rootContext}/resources/css/member/login.css">
	<script src="${rootContext}/resources/js/member/login.js"></script>
	<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">
	</html>
