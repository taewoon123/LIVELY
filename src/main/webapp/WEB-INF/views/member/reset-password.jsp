<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Reset Password</title>
</head>

<body>
	<div>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
	</div>

	<div id="wrap">
		<div class="form-container">
			<p class="title">비밀번호 재설정</p>

			<form class="form" action="${rootContext}/member/reset-password" method="post">

				<table id="join-form">
					<tbody>

						<tr>
							<td>
								ID
							</td>
							<th>
								<div class="input-group">
									<input type="text" name="id" id="id" value="${memberCheck.id}" readonly>
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
							<th colspan="3">
								<input type="submit" id="join-button" value="재설정">
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