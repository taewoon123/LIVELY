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
<body>

<footer class="site-footer">
  <div class="site-footer-top">
    <div class="container">
      <div class="row">

        <div class="col-lg-6 col-12">
          <h2 class="text-white mb-lg-0">Festava Live</h2>
        </div>

        <div class="col-lg-6 col-12 d-flex justify-content-lg-end align-items-center">
          <ul class="social-icon d-flex justify-content-lg-end">
            <li class="social-icon-item">
              <a href="#" class="social-icon-link">
                <span class="bi-twitter"></span>
              </a>
            </li>

            <li class="social-icon-item">
              <a href="#" class="social-icon-link">
                <span class="bi-apple"></span>
              </a>
            </li>

            <li class="social-icon-item">
              <a href="#" class="social-icon-link">
                <span class="bi-instagram"></span>
              </a>
            </li>

            <li class="social-icon-item">
              <a href="#" class="social-icon-link">
                <span class="bi-youtube"></span>
              </a>
            </li>

            <li class="social-icon-item">
              <a href="#" class="social-icon-link">
                <span class="bi-pinterest"></span>
              </a>
            </li>
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
            <a href="#" class="site-footer-link">Artists</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Schedule</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Pricing</a>
          </li>

          <li class="site-footer-link-item">
            <a href="#" class="site-footer-link">Contact</a>
          </li>
        </ul>
      </div>

      <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
        <h5 class="site-footer-title mb-3">Have a question?</h5>

        <p class="text-white d-flex mb-1">
          <a href="tel: 090-080-0760" class="site-footer-link">
            090-080-0760
          </a>
        </p>

        <p class="text-white d-flex">
          <a href="mailto:hello@company.com" class="site-footer-link">
            hello@company.com
          </a>
        </p>
      </div>

      <div class="col-lg-3 col-md-6 col-11 mb-4 mb-lg-0 mb-md-0">
        <h5 class="site-footer-title mb-3">Location</h5>

        <p class="text-white d-flex mt-3 mb-2">
          Silang Junction South, Tagaytay, Cavite, Philippines</p>

        <a class="link-fx-1 color-contrast-higher mt-3" href="#">
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
</footer>





</body>
<script src="${rootContext}/resources/js/common/jquery.min.js"></script>
<script src="${rootContext}/resources/js/common/bootstrap.min.js"></script>
<script src="${rootContext}/resources/js/common/jquery.sticky.js"></script>
<script src="${rootContext}/resources/js/common/click-scroll.js"></script>
<script src="${rootContext}/resources/js/common/custom.js"></script>
</html>
