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

                    <h3>Friend</h3>

                    <div class="form__group">
                        <input type="text" class="form__field w-100" placeholder="Input text">
                        <label  class="form__label"> 제목 </label>
                    </div>
                </div>
                <div class="write-group">
                    <textarea name="content" id="content" cols="30" rows="10" style="resize: none"></textarea>
                </div>

                <!-- UI첨부파일(drop files) -->
                <form class="form">
                    <label for="file-input" class="drop-container">
                        <span class="drop-title">Drop files here</span>
                        or
                        <input type="file" accept="image/*" required="" id="file-input">
                    </label>
                    <p class="form-paragraph">
                        File should be an image or video
                      </p>
                  </form>

                <div class="register">
                    <div id="registerName"><input value="취소" type="submit"></div>
                    <div id="registerName"><input value="등록" type="submit"></div>
                </div>
            </form>
        </div> 
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>
</html>
  <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-form.css">