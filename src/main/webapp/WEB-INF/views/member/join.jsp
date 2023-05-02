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
		</div>

		<div id="wrap">
			<div class="form-container">
				<p class="title">Join</p>

				<form class="form" action="${rootContext}/member/login" method="post">

					<table>
						<tbody>
							<tr>
								<td>
									ID
								</td>
								<th>
									<div class="input-group">
										<input type="text" name="id" id="id" placeholder="">
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
										<input type="password" name="password" id="password" placeholder="">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									Password Check
								</td>
								<th>
									<div class="input-group">
										<input type="password" name="password2" id="password2" placeholder="">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									Name
								</td>
								<th>
									<div class="input-group">
										<input type="text" name="Name" id="name" placeholder="">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									E-mail
								</td>
								<th>
									<div class="input-group">
										<input type="email" name="email" id="email" placeholder=" ex) kim@naver.com">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									Birth
								</td>
								<th>
									<div class="input-group">
										<input type="text" name="birth" id="birth" placeholder=" ex) 19951231">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									HP
								</td>
								<th>
									<div class="input-group">
										<input type="text" name="phone" id="phone" placeholder=" ex) 01055550000">
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									Gender
								</td>
								<th>
									<div class="selections">
										<span id="Female">
											<input type="radio" name="gender" id="female" value="0"> <label for="female">Female</label>
										</span>
										<span id="Male">
											<input type="radio" name="gender" id="male" value="1"> <label for="male">Male</label>
										</span>
									</div>
								</th>
								<td id="id-validity">

								</td>
							</tr>

							<tr>
								<td>
									Location
								</td>
								<th>
									<div class="selections">
										<select class="location-option" name="location" id="location">
											<option value="0" selected>지역선택</option>
											<option value="1">강동구</option>
											<option value="2">강서구</option>
											<option value="3">강남구</option>
											<option value="4">강북구</option>
										</select>
									</div>
								</th>
								<td id="id-validity">
								</td>
							</tr>

							<tr>
								<th colspan="3">
									<button id="join-button">Join</button>
								</th>
							</tr>
						</tbody>

					</table>

				</form>

			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	</body>

	<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">

	<link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">
	<script src="${rootContext}\resources\js\member\join.js"></script>

	</html>