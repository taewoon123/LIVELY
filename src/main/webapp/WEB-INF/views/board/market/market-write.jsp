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

                    <h3 id="friend-title">Market</h3>

                    <div class="selections">
                        <select class="location-option" name="location" id="location" required>
                            <option value="0" selected>지역선택</option>
                            <option value="1">강동구</option>
                            <option value="2">강서구</option>
                            <option value="3">강남구</option>
                            <option value="4">강북구</option>
                        </select>
                    </div>
                    <div class="form__group">
                        <input type="text" class="form__field" placeholder="제목" required>
                    </div>
                </div>
                <div class="write-group">
                    <textarea name="content" id="content" cols="30" rows="10" style="resize: none" placeholder="내용" required></textarea>
                </div>

                <!-- UI첨부파일(drop files) -->
                    <p class="form-paragraph">
                        File should be an image or video
                      </p>
                    <label for="file-input" class="drop-container">
                        <span class="drop-title">Drop files here</span>
                        <a>or</a>
                        <input type="file" accept="image/*" id="file-input" style="font-size: 15px">
                    </label>
                    <div class="tag-group">
                        <input type="text" class="tag" placeholder="#태그" >
                    </div>

                <div class="register">
                    <div id="registerName" onclick="location.href='${rootContext}/market/list'"><input value="취소" type="button"></div>
                    <div id="registerName"><input value="등록" type="submit"></div>
                </div>
            </form>
        </div> 
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>
</html>
  <link rel="stylesheet" href="${rootContext}/resources/css/board/market/market-write.css">
  
<!-- <script>
function register_button() {
	
}
</script> -->