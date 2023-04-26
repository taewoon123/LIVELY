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

		<%@ include file="/WEB-INF/views/common/header.jsp" %>

			<div id="whole">
				<div class="form-container">
					<p class="title">Join</p>

					<form class="form">

						<div class="input-group">
							<input type="text" name="id" id="id" placeholder="ID">
						</div>

						<div class="input-group">
							<input type="password" name="password" id="password" placeholder="Password">
						</div>
						<div class="input-group">
							<input type="password" name="password2" id="password2" placeholder="Password Check">
						</div>

						<div class="input-group">
							<input type="text" name="Name" id="Name" placeholder="Name">
						</div>
						<div class="input-group">
							<input type="email" name="E-mail" id="E-mail" placeholder="E-mail  ex) kim@naver.com">
						</div>
						<div class="input-group">
							<input type="text" name="Birth" id="Birth" placeholder="Birth  ex) 19951231">
						</div>
						<div class="input-group">
							<input type="text" name="HP" id="HP" placeholder="HP  ex) 01055550000">
						</div>
						<label for="">
							<div class="input-group">
								<input type="radio" name="Gender" id="F" value="0"> Male 
								<input type="radio" name="Gender" id="M" value="1"> Female
							</div>
						</label>
						<div class="input-group">
							<select name="location" id="location" placeholder="Location">
								<option value="0" selected>지역선택</option>
								<option value="1">강동구</option>
								<option value="2">강서구</option>
								<option value="3">강남구</option>
								<option value="4">강북구</option>
							</select>
							<br>
							<button class="sign">Join</button>
					</form>
					
				</div>
			</div>

	</body>
	<link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">

	</html>