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

		<%@ include file="${rootContext}/WEB-INF/views/common/header.jsp" %>

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
								</tr>

								<tr>
									<td>
										Name
									</td>
									<th>
										<div class="input-group">
											<input type="text" name="Name" id="Name" placeholder="">
										</div>
									</th>
								</tr>

								<tr>
									<td>
										E-mail
									</td>
									<th>
										<div class="input-group">
											<input type="email" name="E-mail" id="E-mail" placeholder=" ex) kim@naver.com">
										</div>
									</th>
								</tr>

								<tr>
									<td>
										Birth
									</td>
									<th>
										<div class="input-group">
											<input type="text" name="Birth" id="Birth" placeholder=" ex) 19951231">
										</div>
									</th>
								</tr>

								<tr>
									<td>
										HP
									</td>
									<th>
										<div class="input-group">
											<input type="text" name="HP" id="HP" placeholder=" ex) 01055550000">
										</div>
									</th>
								</tr>

								<tr>
									<td>
										Gender
									</td>
									<th>
										<div class="selections">
											<span id="Female">
												<input type="radio" name="Gender" id="F" value="0"> <label for="F">Female</label>
											</span>
											<span id="Male">
												<input type="radio" name="Gender" id="M" value="1"> <label for="M">Male</label>
											</span>
										</div>
									</th>
								</tr>

								<tr>
									<td>
										Location
									</td>
									<th>
										<div class="selections">
											<select class="location_option" name="location" id="location" placeholder="Location">
												<option value="0" selected>지역선택</option>
												<option value="1">강동구</option>
												<option value="2">강서구</option>
												<option value="3">강남구</option>
												<option value="4">강북구</option>
											</select>
										</div>
									</th>
								</tr>

								<tr>
									<th colspan="2">
										<button id="join-button">Join</button>
									</th>
								</tr>
							</tbody>

						</table>

					</form>

				</div>
			</div>

			<%@ include file="${rootContext}/WEB-INF/views/common/footer.jsp" %>

	</body>
	<link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">

	</html>