<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="write-board">

			<form class="formz" action="${rootContext}/job/write" method="post" enctype="multipart/form-data">
				<div class="write-group">

					<h3 id="job-title">Job/Recruit</h3>
			
					<input type="radio" name="jobCategoryNo" value="1"
						id="jobCategory1" checked> <label for="jobCategory1" >구인</label> 
						<input type="radio" name="jobCategoryNo" value="2" id="jobCategory2">
					<label for="jobCategory2">구직</label>
					<div class="selections">
						<select class="location-option" name="locationNo" id="location">
							<c:forEach items="${locationList}" var="locationList">
								<option value="${locationList.getLocationNo()}">${locationList.getLocationName()}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form__group">
						<input type="text" name="title" class="form__field"
							placeholder="제목" required>
					</div>
				</div>
				<div class="write-group">
					<textarea name="content" id="content" cols="30" rows="10"
						style="resize: none" placeholder="내용" required></textarea>
				</div>

				<!-- UI첨부파일(drop files) -->
				<p class="form-paragraph">File should be an image or video</p>
				<label for="file-input" class="drop-container"> <span
					class="drop-title">Drop files here</span> <a>or</a> 
					<input type="file" accept="image/*" id="file-input"
					style="font-size: 15px" name="file" multiple accept=".jpg,.png,.jpeg">
				</label>
				



				<div class="register">
					<div id="registerName">
						<input value="취소" type="button"
							onclick="location.href='${rootContext}/job/list'">
					</div>

					<div id="registerName">
						<input value="등록" type="submit">
					</div>

				</div>

			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

</body>
</html>
<link rel="stylesheet"
	href="${rootContext}/resources/css/board/job/job-write.css">
<%--  <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" /> --%>