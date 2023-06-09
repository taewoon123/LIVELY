<%@ page language="java" pageEncoding="UTF-8" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Notice-write</title>
    </head>

    <body>

        <div id="wrap">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <%@ include file="/WEB-INF/views/common/alertMsg.jsp"%>

                <div class="write-board">
                    <form action="${rootContext}/notice/write" method="POST">
                        <div class="write-group">

                            <h3 id="notice-title">Notice</h3>

                            <div class="form__group">
                                <input type="text" name="noticeTitle" class="form__field" placeholder="제목" required>
                            </div>
                        </div>
                        <div class="write-group">
                            <textarea name="noticeContent" id="noticeContent" cols="30" rows="10" style="resize: none"
                                placeholder="내용" required></textarea>
                        </div>

                        <div class="register">
                            <div id="registerName"><input value="취소" type="button"
                                    onclick="location.href='${rootContext}/notice/list'"></div>
                            <div id="registerName"><input value="등록" type="submit"></div>
                        </div>
                    </form>
                </div>
                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>

    </body>

    </html>
    <link rel="stylesheet" href="${rootContext}/resources/css/board/notice/notice-write.css">