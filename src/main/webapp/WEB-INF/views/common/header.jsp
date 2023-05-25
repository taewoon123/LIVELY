<%--
  Created by IntelliJ IDEA.
  User: b9
  Date: 2023-04-19
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="rootContext" value="${pageContext.request.contextPath}" scope="page" />
<html>

<head>
    <title>Title</title>
</head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">
<link href="${rootContext}/resources/css/common/bootstrap.min.css" rel="stylesheet">
<link href="${rootContext}/resources/css/common/bootstrap-icons.css" rel="stylesheet">
<link href="${rootContext}/resources/css/common/templatemo-festava-live.css" rel="stylesheet">

	
<body>
    <main>
        <nav class="navbar navbar-expand-lg">
                    <div class="container">
                        <a class="navbar-brand" href="${rootContext}/main">
                            <img src="/lively/resources/img/Lively.png" alt="Lively Logo" width="60px" height="60px" class="site-footer-logo-img">
                            Lively
                        </a>

<%--                        <a href="ticket.html" class="btn custom-btn d-lg-none ms-auto me-4">Buy Ticket</a>--%>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav align-items-lg-center ms-auto me-lg-5">
                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_1">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_2">About</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link dropdown-btn">Boards
                                        <select name="board-select" id="" class="dropdown-content" onchange="if(this.value) location.href=(this.value);">
                                            <option value="">게시판 선택</option>
                                            <option value="${rootContext}/query/list">질문 게시판</option>
                                            <option value="${rootContext}/help/list">도움 게시판</option>
                                            <option value="${rootContext}/job/list">구인구직 게시판</option>
                                            <option value="${rootContext}/fund/list">기부 게시판</option>
                                            <option value="${rootContext}/market/list">중고 장터</option>
                                            <option value="${rootContext}/friend/list">친구 구하기</option>
                                        </select>
                                    </a>

                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_5">Customer Center</a>
                                </li>

<%--                                <li class="nav-item">--%>
<%--                                    <a class="nav-link click-scroll" href="#section_5">Contact</a>--%>
<%--                                </li>--%>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_6">Contact</a>
                                </li>
                            </ul>

                            <c:choose>
                                <c:when test="${sessionScope.memberLog == null && sessionScope.adminLog == null}">
                                    <span style="width: 135px;"></span>
                                    <a href="${rootContext}/member/join" class="btn custom-btn d-lg-block d-none">Sign Up</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${rootContext}/member/login" class="btn custom-btn d-lg-block d-none">Sign In</a>
                                </c:when>
                                <c:when test="${sessionScope.memberLog != null}">
                                    <span style="width: 135px; color: #078735; font-size: 17px;">hello! <br> <strong>${memberLog.name}</strong> &nbsp;&nbsp;</span>
                                    <a href="${rootContext}/member/my-info" class="btn custom-btn d-lg-block d-none">My Page</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${rootContext}/member/logout" class="btn custom-btn d-lg-block d-none">Logout</a>
                                </c:when>
                                <c:when test="${sessionScope.adminLog != null}">
                                    <a href="${rootContext}/admin/dashboard" class="btn custom-btn d-lg-block d-none">DashBoard</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${rootContext}/admin/logout" class="btn custom-btn d-lg-block d-none">Logout</a>
                                </c:when>
                            </c:choose>

                        </div>
                    </div>
                </nav>

    </main>
</body>
<script src="${rootContext}/resources/js/common/jquery.min.js"></script>
<script src="${rootContext}/resources/js/common/bootstrap.min.js"></script>
<%--<script src="${rootContext}/resources/js/common/jquery.sticky.js"></script>--%>
<script src="${rootContext}/resources/js/common/click-scroll.js"></script>
<script src="${rootContext}/resources/js/common/custom.js"></script>

<link rel="stylesheet" href="${rootContext}/resources/css/common/header-style.css">
</html>
