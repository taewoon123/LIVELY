<%@ page language="java"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Friend</title>
</head>


<body>

   <div id="wrap">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
    
        <div class="write-board">
            <form action="${rootContext}/friend/edit" method="POST" enctype="multipart/form-data">
                <div class="write-group">

					<%-- <c:forEach var="i" begin="0" end="friendDetail.length"> --%>
                    <div id="title_group">
                        <div id="friend-title">
                            <h3>Friend</h3>
                        </div>
                        <div id="Recruit">
                            <div id="label">
<!--                                 <label><input type="radio" name="RecruitButton" value="RecruitOn" checked>모집중</label> &nbsp;
                                <label><input type="radio" name="RecruitButton" value="RecruitOff">모집마감</label> -->
                            </div>
                        </div>
                        <div class="selections">
              			<select class="location-option" name="locationNo" id="location">
  							<c:forEach items="${locationList}" var="location">
    							<option value="${location.getLocationNo()}">${location.getLocationName()}</option>
  							</c:forEach>
						</select>
                        </div>
                    </div>
                    
                    <div class="form__group">
                        <input type="hidden" name="writer" value="${friendDetail[0].writer}">
                        <input type="hidden" name="friendNo" value="${friendDetail[0].friendNo}">
                        <input type="text" class="form__field" id="title" name="title" value="${friendDetail[0].title}" required>
                    </div>
                </div>
                <div class="write-group">
                    <textarea name="content" id="content" cols="30" rows="10" style="resize: none" required>${friendDetail[0].content}</textarea>
                </div>

                <!-- UI첨부파일(drop files) -->
                
                    <p class="form-paragraph">
                        File should be an image or video
                      </p>
                    <label for="file-input" class="drop-container">
                        <span class="drop-title">Drop files here</span>
                        <a>or</a>
                        <input type="file" accept="image/*"  id="file-input" style="font-size: 15px" name="f" multiple accept=".jpg,.png,.jpeg">
                    </label>
                    <!-- <div class="tag-group">
                        <input type="text" class="tag" value="" >
                    </div> -->
                    
                   <%--  </c:forEach> --%>

                <div class="register">
                    <div id="registerName" onclick="location.href='${rootContext}/friend/my-feed'"><input value="취소" type="button"></div>
                    <div id="registerName"><input value="수정" type="submit"></div>
                </div>
            </form>
        </div> 
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>
  <script src="${rootContext}/resources/js/board/friend-write.js"></script>
</html>
  <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-edit.css">

