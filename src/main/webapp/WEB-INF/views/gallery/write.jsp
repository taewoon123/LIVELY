
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
            <form action="${rootContext}/gallery/write" method="POST" enctype="multipart/form-data">
                <div class="write-group">

                    <div id="title_group">
                        <div id="friend-title">
                            <h3>Market</h3>
                        </div>
                        <div id="Recruit">
                            <div id="label">
<!--                                 <label><input type="radio" name="RecruitButton" value="RecruitOn" checked>모집중</label> &nbsp;
                                <label><input type="radio" name="RecruitButton" value="RecruitOff">모집마감</label> -->
                            </div>
                        </div>
                     
                    </div>
                    
                    <div class="form__group">
                        <input type="text" class="form__field" id="title" name="title" placeholder="제목" required>
                    </div>
                </div>
                <div class="write-group">
                    <textarea name="content" id="content" cols="30" rows="10" style="resize: none" required placeholder="내용"></textarea>
                </div>

                <!-- UI첨부파일(drop files) -->
                
                    <p class="form-paragraph">
                        File should be an image or video
                      </p>
                    <label for="file-input" class="drop-container">
                        <span class="drop-title">Drop files here</span>
                        <a>or</a>
                        <input type="file" accept="image/*"  id="file-input" style="font-size: 15px" name="file" multiple accept=".jpg,.png,.jpeg">
                    </label>
                    <div class="tag-group">
                        <input type="text" class="tag" placeholder="#태그" >
                    </div>

                

                <div class="register">
                    <div id="registerName" onclick="location.href='${rootContext}/gallery/list'"><input value="취소" type="button"></div>
                    <div id="registerName"><input value="등록" type="submit"></div>
                </div>
            </form>
        </div> 
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>
</html>
  <link rel="stylesheet" href="${rootContext}/resources/css/board/market/market-write.css">
  <script src="${rootContext}/resources/js/board/market/market-write.js"></script>