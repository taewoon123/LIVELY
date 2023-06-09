<%@ page language="java" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Help-write</title>
</head>

<body>

<div id="wrap">
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

    <div class="write-board">
        <form action="${rootContext}/help/edit?num=${vo.helpNo}" method="POST" enctype="multipart/form-data">
            <div class="write-group">

                <h3 id="friend-title">Help</h3>

                		<%--지역 --%>
                		<select class="location-option" name="locationNo" id="location">
  							<c:forEach items="${locationList}" var="location">
    							<option value="${location.getLocationNo()}">${location.getLocationName()}</option>
  							</c:forEach>
						</select>

                <div class="form__group">
                	<input type="text" name="helpNo" value="${hvo.helpNo}" style="display: none">
                	<input type="text" name="writer" value="${hvo.writer}" style="display: none">
                    <input type="text" name="title" class="form__field" placeholder="제목" required value="${hvo.title}">
                </div>
            </div>
            <div class="write-group">
                            <textarea name="content" id="content" cols="30" rows="10" style="resize: none"
                            placeholder="내용" required>${hvo.content}</textarea>
            </div>

            <!-- UI첨부파일(drop files) -->
            <p class="form-paragraph">
                File should be an image or video
            </p>
            <label for="file-input" class="drop-container">
                <span class="drop-title">Drop files here</span>
                <a>or</a>
                <input type="file" accept="image/*" id="file-input" style="font-size: 15px" name="file" multiple accept=".jpg,.png,.jpeg">
            </label>

            <div class="register">
                    <div id="registerName" onclick="location.href='${rootContext}/help/list'"><input value="취소" type="button"></div>
                    <div id="registerName"><input value="수정" type="submit"></div>
                </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>

</body>

</html>
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-edit.css">