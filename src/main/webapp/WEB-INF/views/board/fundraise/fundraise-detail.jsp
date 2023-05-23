<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<header>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

<div id="wrap">
    <main>

        <br>

        <div class="view-area active">
            <a href="${rootContext}/fund/list" id="list-btn">목록</a>
            <div id="help-area">
                <div id="help-title">제목</div>
                <div id="help-inTitle">${fundDetail.title}</div>
                <div id="help-date">작성일자</div>
                <div id="help-inDate">${fundDetail.enrollDate}</div>
                <div id="help-hit">조회수</div>
                <div id="help-inHit">${fundDetail.views}</div>
                <div id="help-content">내용</div>
                <div id="help-inContent">${fundDetail.content}</div>
            </div>

            <c:if test="${memberLog.id eq fundDetail.writer }">
                <!-- 작성 버튼 -->
                <button id="write_submit_delete" onclick="location.href='${rootContext}/fund/delete?no=${fundNo}'">
                    <span>삭제하기</span>
                </button>
                <span style="color: whitesmoke">${fundraiseNo}</span>

                <button id="write_submit_edit">
                    <span>수정하기</span>
                </button>
            </c:if>


        </div>

        <div id="comment" style="visibility: hidden">
            <input id="comment-input" name="comment" placeholder="댓글을 입력해 주세요.">
            <button id="submit" name="comment">등록</button>
        </div>

        <!-- js때문에 있어야함. -->
        <div id="comments"></div>

        <footer>
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
        </footer>

    </main>

</div> <!-- div wrap end -->

</body>
<script>
    if(${fundDetailAlert != null}){
        alert("${fundDetailAlert}");
    }

</script>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
