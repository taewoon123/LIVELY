<%@ page language="java" pageEncoding="UTF-8" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Qna-write</title>
    </head>

    <body>

        <div id="wrap">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>

                <div class="write-board">
                    <form action="${rootContext}/qna/write" method="POST">
                        <div class="write-group">

                            <h3 id="friend-title">Qna</h3>

                            <div class="form__group">
                                <input type="text" name="qnaTitle" class="form__field" placeholder="제목" required>
                                <!-- 0505 :required 추가 -->
                            </div>
                        </div>
                        <div class="write-group">
                            <textarea name="qnaContent" id="qnaContent" cols="30" rows="10" style="resize: none"
                                placeholder="내용" required></textarea>
                            <!-- 0505 :required 추가 -->
                        </div>

                        <!-- 0505 : 파일 업로드란 감싸고 있던 form 태그 제거함 -->

                        <!-- UI첨부파일(drop files) -->
                   

                        <div class="register">
                            <div id="registerName"><input value="취소" type="button"
                                    onclick="location.href='${rootContext}/qna/list'"></div>
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
                      