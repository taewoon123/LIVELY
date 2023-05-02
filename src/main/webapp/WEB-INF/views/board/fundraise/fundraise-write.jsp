<%@ page language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="wrap">

    <div class="write-board">
        <form>
            <div class="write-group">

                <h3 id="friend-title">Friend</h3>

                <div class="form__group">
                    <input type="text" class="form__field" placeholder="제목">
                </div>
            </div>
            <div class="write-group">
                <textarea name="content" id="content" cols="30" rows="10" style="resize: none"></textarea>
            </div>

            <!-- UI첨부파일(drop files) -->
            <form class="form">
                <label for="file-input" class="drop-container">
                    <span class="drop-title">Drop files here</span>
                    <a>or</a>
                    <input type="file" accept="image/*" required="" id="file-input" style="font-size: 15px">
                </label>
                <p class="form-paragraph">
                    File should be an image or video
                </p>
            </form>

            <div class="register">
                <div id="registerName"><input value="취소" type="submit"></div>
                <div id="registerName"><input value="등록" type="submit"></div>
            </div>

            <div id="tag-input">
                <input type="text" name="tags" placeholder="태그를 #과함께 입력하세요">
            </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>

</body>
</html>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-write.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>
