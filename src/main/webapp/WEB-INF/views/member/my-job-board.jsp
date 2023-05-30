<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>나의 구인구직 게시글</title>
</head>
<header>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
</header>

<body>

    <h2>JOB</h2>

    <!-- list table -->
    <div id="wrap">

        <main>

            <!-- search button -->
            <div class="container-input">
                <select class="boardType" name="boardType" onchange="if(this.value) location.href=(this.value);">
                    <option value="" >--게시판 선택--</option>
                    <option value="${rootContext}/member/my-query-board">질문 게시판</option>
                    <option value="${rootContext}/member/my-help-board">도움 게시판</option>
                    <option value="${rootContext}/member/my-job-board">구인구직 게시판</option>
                    <option value="${rootContext}/member/my-fundraise-board">기부 게시판</option>
                </select>
                <input type="text" placeholder="Search" name="text" class="input">
            </div>

            <br> <br> <br>

            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>작성일시</th>
                        <th>조회수</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${jvoList}" var="job">
                        <tr>
                            <td>${job.jobNo}</td>
                            <td>${job.title}</td>
                            <td>${job.enrollDate}</td>
                            <td>${job.views}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 작성 버튼 -->
            <button id="write_submit">
                <span>
                    <a class="write-btn" href="${rootContext}/job/write">write</a>
                </span>
            </button>

            <!-- pagenation -->
            <div class="page-area">
                <div class="pagination-custom">
                    <c:if test="${pv.currentPage > 1}">
                        <a class="prev page-numbers" href="${rootContext}/job/list?page=${pv.currentPage-1}">
                            << </a>
                    </c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a class="page-numbers" href="${rootContext}/job/list?page=${i}">${i}</a>
                        </c:if>
                        <c:if test="${pv.currentPage == i}">
                            <a class="page-numbers">${i}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pv.currentPage < pv.maxPage}">
                        <a class="next page-numbers" href="${rootContext}/job/list?page=${pv.currentPage+1}"> >>
                        </a>
                    </c:if>
                </div> <!-- div pagination-custom -->
            </div> <!-- div page-area end -->

            <footer>
                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
            </footer>

        </main>

    </div> <!-- div wrap end -->


</body>

</html>
<link rel="stylesheet" href="${rootContext}/resources/css/board/job/job-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />

<script>
    const table = document.querySelector("main table tbody");
    table.addEventListener("click", function (event) {
        const no = event.target.parentNode.children[0].innerText; //해당 글 번호를 불러올수있음
        location.href = '${rootContext}/job/detail?no=' + no;
    });
</script>

<link rel="stylesheet" href="${rootContext}\resources\css\member\my-board.css">