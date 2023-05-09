<%@ page language="java" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>질문게시판 상세</title>
    </head>
    <header>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
    </header>

    <body>

        <div id="wrap">
            <main>

                <div class="view-area active">
                    <a href="${rootContext}/query/list" id="list-btn">목록</a>
                    <div id="detail-area">
                        <div id="detail-title">제목</div>
                        <div id="detail-inTitle">회원정보 수정</div>
                        <div id="detail-date">작성일자</div>
                        <div id="detail-inDate">2023-05-24</div>
                        <div id="detail-hit">조회수</div>
                        <div id="detail-inHit">1</div>
                        <div id="detail-content">내용</div>
                        <div id="detail-inContent">회원정보 수정은 어디서 하나요?</div>
                    </div>

                    <!-- 작성 버튼 -->
                    <button id="write_submit_delete">
                        <span>삭제하기</span>
                    </button>

                    <button id="write_submit_edit">
                        <span>수정하기</span>
                    </button>

                </div>

            </main>
        </div>

        <div id="comment">
            <div id="comment-count">
                댓글 <span id="count">0</span>
            </div>
            <input id="comment-input" name="comment" placeholder="  댓글을 입력해 주세요">
            <button id="submit" name="comment">등록</button>
            <!-- name 값 모두 "" 붙여줌 -->
        </div>
        <!--  <div id=comments >
      <button id="comments-edit" type="submit">수정</button>
      <button  type="submit">삭제</button>
   </div>
 -->

        <br>
        <br>

        <footer>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </footer>
    </body>

    </html>

    <link rel="stylesheet" href="${rootContext}/resources/css/board/job/job-detail.css">