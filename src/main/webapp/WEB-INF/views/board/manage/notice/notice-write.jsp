<%@ page language="java" pageEncoding="UTF-8" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Notice-write</title>
    </head>

    <body>

        <div id="wrap">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>

                <div class="write-board">
                    <form action="${rootContext}/notice/write" method="POST">
                        <div class="write-group">

                            <h3 id="friend-title">Notice</h3>

                            <div class="form__group">
                                <input type="text" name="noticeTitle" class="form__field" placeholder="제목" required>
                                <!-- 0505 :required 추가 -->
                            </div>
                        </div>
                        <div class="write-group">
                            <textarea name="noticeContent" id="noticeContent" cols="30" rows="10" style="resize: none"
                                placeholder="내용" required></textarea>
                            <!-- 0505 :required 추가 -->
                        </div>

                        <!-- 0505 : 파일 업로드란 감싸고 있던 form 태그 제거함 -->

                        <!-- UI첨부파일(drop files) -->
                        <!-- <p class="form-paragraph">
                            File should be an image or video
                        </p>
                        <label for="file-input" class="drop-container">
                            <span class="drop-title">Drop files here</span>
                            <a>or</a>
                            <input type="file" accept="image/*" id="file-input" style="font-size: 15px">
                            0505 :required 삭제
                        </label>
                        <div class="tag-group">
                            <input type="text" class="tag" placeholder="#태그">
                        </div> -->

                        <div class="register">
                            <div id="registerName"><input value="취소" type="button"
                                    onclick="location.href='${rootContext}/notice/list'"></div>
                            <!-- 등록버튼만 submit되야하므로 취소버튼은 button타입으로 바꾸고 onclick 속성으로 페이지이동 구현함. -->
                            <div id="registerName"><input value="등록" type="submit"></div>
                        </div>
                    </form>
                </div>
                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>

    </body>

    </html>
    <%-- <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" /> --%>
    <link rel="stylesheet" href="${rootContext}/resources/css/board/friend/friend-write.css">
    <link rel="stylesheet" href="${rootContext}/resources/css/board/query/query-write.css">
    <!-- 취소버튼에도 등록버튼과 같은 css를 주기위해 freiend form.css의 127번째줄 복사하여 input[type=button]에도 동일하게 적용 -->