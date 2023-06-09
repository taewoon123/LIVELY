<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
<%--            <label for="search-type" id=""></label>--%>
<%--            <select name="search-type" id="search-type">--%>
<%--                <option value="">제목</option>--%>
<%--                <option value="">내용</option>--%>
<%--                <option value="">작성자</option>--%>
<%--            </select>--%>
            <input type="text" placeholder="Search" name="searchValue" class="input">
            <svg fill="#000000" width="20px" height="20px"
                 viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
                        fill-rule="evenodd">
                </path>
            </svg>
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
                <th>지역</th>
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
                    <td>${fundraise.locationName}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- 작성 버튼 -->
        <button id="write_submit">
				<span> <a class="write-btn" href="${rootContext}/fund/write">write</a>
				</span>
        </button>

        <%--   pagination   --%>
        <div class="page-area">
            <div class="pagination-custom">
                <c:if test="${pageVo.currentPage > 1}">
                    <a class="prev page-numbers" href="${rootContext}/fund/list?page=${pageVo.currentPage-1}"> << </a>
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
                    <a class="next page-numbers" href="${rootContext}/fund/list?page=${pageVo.currentPage+1}"> >> </a>
                </c:if>
            </div>
        </div>
        <%--   pagination end  --%>

        <footer>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </footer>

    </main>

</div> <!-- div wrap end -->

</body>
</html>
<script>
    if(${fundWriteAlert != null}){
        alert("${fundWriteAlert}")
    }
</script>
<script src="${rootContext}/resources/js/board/fundraise/fund-list.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"/>
