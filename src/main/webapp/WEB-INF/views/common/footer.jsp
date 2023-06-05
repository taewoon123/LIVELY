<%--
  Created by IntelliJ IDEA.
  User: b9
  Date: 2023-04-19
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rootContext" value="${pageContext.request.contextPath}" scope="page" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<link href="${rootContext}/resources/css/common/footer-style.css" rel="stylesheet">
<style>

</style>
<body>
<footer class="site-footer">
  <div class="site-footer-top">
    <div class="container">
      <div class="row">

        <div class="col-lg-6 col-12">
          <div class="site-footer-logo-img-div">
          <h2 class="text-white mb-lg-0 logo-img-text">Lively</h2>
          </div>
        </div>

        <div class="col-lg-6 col-12 d-flex justify-content-lg-end align-items-center">
          <ul class="social-icon d-flex justify-content-lg-end">
            <li class="social-icon-item">
              <a href="https://twitter.com/Live__Lively" class="social-icon-link" target="_blank">
                <img src="${rootContext}/resources/img/twitter.png" alt="" width="15px" height="15px" class="social-icon-logo">
              </a>
            </li>

<%--            <li class="social-icon-item">--%>
<%--              <a href="#" class="social-icon-link">--%>
<%--                <span class="bi-apple"></span>--%>
<%--              </a>--%>
<%--            </li>--%>

            <li class="social-icon-item">
              <a href="https://www.instagram.com/wooni_234/" class="social-icon-link" target="_blank">
                <img src="${rootContext}/resources/img/instagram.png" alt="" width="15px" height="15px" class="social-icon-logo">
              </a>
            </li>

            <li class="social-icon-item">
              <a href="https://www.youtube.com/watch?v=W7oQMSLQAU4" class="social-icon-link" target="_blank">
                <img src="${rootContext}/resources/img/youtube.png" alt="" width="15px" height="15px" class="social-icon-logo">
              </a>
            </li>

<%--            <li class="social-icon-item">--%>
<%--              <a href="#" class="social-icon-link">--%>
<%--                <span class="bi-pinterest"></span>--%>
<%--              </a>--%>
<%--            </li>--%>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">

      <div class="col-lg-6 col-12 mb-4 pb-2">
        <h5 class="site-footer-title mb-3">Links</h5>

        <ul class="site-footer-links">
          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Home</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">About</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Boards</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Customer Center</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Contact</a>
          </li>

<%--          <li class="site-footer-link-item">--%>
<%--            <a href="#" class="site-footer-link">Contact</a>--%>
<%--          </li>--%>
        </ul>
      </div>

      <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
        <h5 class="site-footer-title mb-3">Any further question?</h5>
        <h5 class="site-footer-title mb-3">Feel free to ask us.</h5>

        <p class="text-white d-flex mb-1">
          <a href="tel:010-2719-8332 " class="site-footer-link">
            010-2719-8332
          </a>
        </p>

        <p class="text-white d-flex">
          <a href="mailto:lively@info.com" class="site-footer-link" target="_blank">
            lively@info.com
          </a>
        </p>
      </div>

      <div class="col-lg-3 col-md-6 col-11 mb-4 mb-lg-0 mb-md-0">
        <h5 class="site-footer-title mb-3">Location</h5>

        <p class="text-white d-flex mt-3 mb-2">
          1800 West Adams Boulevard
          Los Angeles, CA
          United States</p>

        <a class="link-fx-1 color-contrast-higher mt-3" target="_blank" href="https://www.google.com/maps/place/Adams+%2F+Halldale/@34.0326821,-118.3028637,3a,75y,206.55h,90.7t/data=!3m6!1e1!3m4!1s3xGCEhqMmAzdl0YUThwvtA!2e0!7i16384!8i8192!4m6!3m5!1s0x80c2b80b2d3adeb1:0xf33f3b7b1017fb6a!8m2!3d34.032631!4d-118.30294!16s%2Fg%2F1wyc4lpf">
          <span>Our Maps</span>
          <svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="16" cy="16" r="15.5"></circle>
              <line x1="10" y1="18" x2="16" y2="12"></line>
              <line x1="16" y1="12" x2="22" y2="18"></line>
            </g>
          </svg>
        </a>
      </div>
    </div>
  </div>

  <div class="site-footer-bottom">
    <div class="container">
      <div class="row">

        <div class="col-lg-3 col-12 mt-5">
          <p class="copyright-text">Copyright © 2036 Festava Live Company</p>
          <p class="copyright-text">Distributed by: <a href="https://themewagon.com">ThemeWagon</a></p>
        </div>

        <div class="col-lg-8 col-12 mt-lg-5">
          <ul class="site-footer-links">
            <li class="site-footer-link-item">
              <a href="#" class="site-footer-link">Terms &amp; Conditions</a>
            </li>

            <li class="site-footer-link-item">
              <a href="#" class="site-footer-link">Privacy Policy</a>
            </li>

            <li class="site-footer-link-item">
              <a href="#" class="site-footer-link">Your Feedback</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div id="fixedButton" onclick="TOP();">TOP</div>
</footer>



<link href="${rootContext}/resources/css/common/fixedButton.css" rel="stylesheet">


</body>
<script src="${rootContext}/resources/js/common/jquery.min.js"></script>
<script src="${rootContext}/resources/js/common/bootstrap.min.js"></script>
<script src="${rootContext}/resources/js/common/jquery.sticky.js"></script>
<script src="${rootContext}/resources/js/common/click-scroll.js"></script>
<script src="${rootContext}/resources/js/common/custom.js"></script>
<script src="${rootContext}/resources/js/common/fixedButton.js"></script>
</html>
