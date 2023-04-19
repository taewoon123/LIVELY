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
                        <a class="navbar-brand" href="index.html">
                            Festava Live
                        </a>

                        <a href="ticket.html" class="btn custom-btn d-lg-none ms-auto me-4">Buy Ticket</a>

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
                                    <a class="nav-link click-scroll" href="#section_3">Artists</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_4">Schedule</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_5">Pricing</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll" href="#section_6">Contact</a>
                                </li>
                            </ul>

                            <a href="ticket.html" class="btn custom-btn d-lg-block d-none">Buy Ticket</a>
                        </div>
                    </div>
                </nav>

    </main>
</body>
<script src="${rootContext}/resources/js/common/jquery.min.js"></script>
<script src="${rootContext}/resources/js/common/bootstrap.min.js"></script>
<script src="${rootContext}/resources/js/common/jquery.sticky.js"></script>
<script src="${rootContext}/resources/js/common/click-scroll.js"></script>
<script src="${rootContext}/resources/js/common/custom.js"></script>
</html>
