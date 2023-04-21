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
						<div class="input-group">
							<label for="username">ID</label>
							<input type="text" name="username" id="username" placeholder="">
						</div>
						<div class="input-group">
							<label for="password">Password</label>
							<input type="password" name="password" id="password" placeholder="">
							<div class="forgot"></div>
						</div>
						<br>
						<button class="sign">Sign in</button>
					</form>
					<div class="social-message">
						<div class="line"></div>
						<div class="line"></div>
					</div>
					<div class="social-icons">
						<button aria-label="Log in with Google" class="icon" onclick="location.href=''">
							<img src="${rootContext}/resources/img/google-logo.png" alt="google-logo">
						</button>
						<button aria-label="Log in with Twitter" class="icon">
							<img src="${rootContext}/resources/img/kakao-logo.png" alt="kakao-logo">
						</button>
						<button aria-label="Log in with GitHub" class="icon">
							<img src="${rootContext}/resources/img/github-logo.png" alt="github-logo">
						</button>
					</div>
					<p class="signup">
						<a rel="noopener noreferrer" href="#" class="">Sign up</a>
					</p>
				</div>
			</div>

	</body>
	<link rel="stylesheet" href="${rootContext}/resources/css/login.css">

	</html>