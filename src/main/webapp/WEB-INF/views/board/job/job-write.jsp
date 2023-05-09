<%@ page language="java"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

   <div id="wrap">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
        <div class="write-board">
            <form>
                <div class="write-group">

                    <h3 id="job-title">Job/Recruit</h3>
                    <div id="job-option">
                    job<input type="radio" value="0" name="job" id="job">
                    recruit<input type="radio" value="1" name="job" id="recruit">
                    </div>
                     <div class="selections-location">
                        <select class="location-option" name="location" id="location">
                            <option value="0" selected>지역선택</option>
                            <option value="1">강동구</option>
                            <option value="2">강서구</option>
                            <option value="3">강남구</option>
                            <option value="4">강북구</option>
                        </select>
                    </div>
                    <div class="form__group">
                        <input type="text" class="form__field" placeholder="제목" required="">
                    </div>
                </div>
                <div class="write-group">
                    <textarea name="content" id="content" cols="30" rows="10" style="resize: none"  placeholder="내용"  required=""></textarea>
                </div>

                <!-- UI첨부파일(drop files) -->
                <form class="form">
                    <p class="form-paragraph">
                        File should be an image or video
                      </p>
                    <label for="file-input" class="drop-container">
                        <span class="drop-title">Drop files here</span>
                        <a>or</a>
                        <input type="file" accept="image/*"  id="file-input" style="font-size: 15px">
                    </label>
                    <div class="tag-group">
                        <input type="text" class="tag" placeholder="#태그" >
                    </div>

                  </form>

                <div class="register">
                            <div id="registerName"><input value="취소" type="button"
                                    onclick="location.href='${rootContext}/job/list'"></div>

                    <div id="registerName"><input value="등록" type="submit"></div>
                </div>
            </form>
        </div> 
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>
</html>
  <link rel="stylesheet" href="${rootContext}/resources/css/board/job/job-write.css">
 <%--  <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" /> --%>