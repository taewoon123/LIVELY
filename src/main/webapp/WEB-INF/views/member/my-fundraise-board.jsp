<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>나의 기부 게시글</title>
</head>
<header>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
</header>

<body>

    <h2>Fundraise</h2>

    <!-- list table -->
    <div id="wrap">

        <main>
            <form action="${rootContext}/fund/list" method="get">
                <!-- search button -->
                <div class="container-input">
                    <select class="boardType" name="boardType"
                        onchange="if(this.value) location.href=(this.value);">
                        <option value="" >--게시판 선택--</option>
                        <option value="${rootContext}/member/my-query-board">질문 게시판</option>
                        <option value="${rootContext}/member/my-help-board">도움 게시판</option>
                        <option value="${rootContext}/member/my-job-board">구인구직 게시판</option>
                        <option value="${rootContext}/member/my-fundraise-board">기부 게시판
                        </option>
                    </select>

                    <input type="text" placeholder="Search" name="searchValue" class="input">

                </div>
            </form>
            <br> <br> <br>

            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>작성일시</th>
                        <th>작성자</th>
                        <th>조회수</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${fundraiseList}" var="fundraise">
                        <tr>
                            <td>${fundraise.fundraiseNo}</td>
                            <td>${fundraise.title}</td>
                            <td>${fundraise.enrollDate}</td>
                            <td>${fundraise.writer}</td>
                            <td>${fundraise.views}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 작성 버튼 -->
            <button id="write_submit">
                <span> <a class="write-btn" href="${rootContext}/fund/write">write</a>
                </span>
            </button>

            <%-- pagination --%>
                <div class="page-area">
                    <div class="pagination-custom">
                        <c:if test="${pageVo.currentPage > 1}">
                            <a class="prev page-numbers"
                                href="${rootContext}/fund/list?page=${pageVo.currentPage-1}">
                                << </a>
                        </c:if>
                        <c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" step="1" var="i">
                            <c:if test="${pageVo.currentPage != i}">
                                <a class="page-numbers" href="${rootContext}/fund/list?page=${i}">${i}</a>
                            </c:if>
                            <c:if test="${pageVo.currentPage == i}">
                                <a class="page-numbers">${i}</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageVo.currentPage < pageVo.maxPage}">
                            <a class="next page-numbers"
                                href="${rootContext}/fund/list?page=${pageVo.currentPage+1}"> >> </a>
                        </c:if>
                    </div>
                </div>
                <%-- pagination end --%>

                    <footer>
                        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
                    </footer>

        </main>

    </div> <!-- div wrap end -->

</body>

</html>
<script src="${rootContext}/resources/js/board/fundraise/fund-list.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
<link rel="stylesheet" href="${rootContext}\resources\css\member\my-board.css">