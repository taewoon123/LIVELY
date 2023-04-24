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

			<div id="whole">
				<div class="form-container">
					<p class="title">Login</p>
					
					<form class="form">
						<label for="username">ID</label>
						<div class="input-group">
							<input type="text" name="username" id="username" placeholder="">
						</div>
						<label for="password">Password</label>
						<div class="input-group">
							<input type="password" name="password" id="password" placeholder="">
						</div>
						<br>
						<button class="sign">Sign in</button>
					</form>
					
				</div>
			</div>

	</body>
	<link rel="stylesheet" href="${rootContext}/resources/css/member/login.css">

	</html>