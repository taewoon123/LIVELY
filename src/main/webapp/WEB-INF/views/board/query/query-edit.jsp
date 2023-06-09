<%@ page language="java" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>질문게시판 수정</title>
</head>

<body>

<div id="wrap">
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

    <div class="write-board">
        <form action="${rootContext}/query/edit?num=${vo.queryNo}" method="POST" enctype="multipart/form-data">
            <div class="write-group">

                <h3 id="friend-title">query</h3>

                		<%--지역 --%>
                		<select class="location-option" name="locationNo" id="location">
  							<c:forEach items="${locationList}" var="location">
    							<option value="${location.getLocationNo()}" selected="${location.getLocationNo()}">${location.getLocationName()}</option>
  							</c:forEach>
						</select>

                <div class="form__group">
                	<input type="text" name="queryNo" value="${qvo.queryNo}" style="display: none">
                	<input type="text" name="writer" value="${qvo.writer}" style="display: none">
                    <input type="text" name="title" class="form__field" placeholder="제목" required value="${qvo.title}">
                </div>
            </div>
            <div class="write-group">
                            <textarea name="content" id="content" cols="30" rows="10" style="resize: none"
                            placeholder="내용" required>${qvo.content}</textarea>
                <!-- 0505 :required 추가 -->
            </div>

            <!-- 0505 : 파일 업로드란 감싸고 있던 form 태그 제거함 -->

            <!-- UI첨부파일(drop files) -->
            <p class="form-paragraph">
                File should be an image or video
            </p>
            <label for="file-input" class="drop-container">
                <span class="drop-title">Drop files here</span>
                <a>or</a>
                <input type="file" accept="image/*" id="file-input" style="font-size: 15px" name="file" multiple accept=".jpg,.png,.jpeg">
                <!-- 0505 :required 삭제 -->
            </label>

            <div class="register">
                <div id="registerName"><input value="취소" type="button"
                                              onclick="location.href='${rootContext}/query/list'"></div>
                <!-- 등록버튼만 submit되야하므로 취소버튼은 button타입으로 바꾸고 onclick 속성으로 페이지이동 구현함. -->
                <div id="registerName"><input value="수정" type="submit"></div>
            </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>

</body>

</html>
<%-- <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" /> --%>
     <link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-write.css">
     <link rel="stylesheet" href="${rootContext}/resources/css/board/query/query-write.css">