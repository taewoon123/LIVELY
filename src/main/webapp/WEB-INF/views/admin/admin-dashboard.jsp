<%--
  Created by IntelliJ IDEA.
  User: b9
  Date: 2023-04-24
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>



<body>
<div id="wrap">
  <%@include file="/WEB-INF/views/common/header.jsp" %>
        <%--  제일 바깥 디브  --%>
    <div class="dashboard-outer">

        <%--   회원관리 디브     --%>
      <div class="dashboard" id="member-dashboard" style="background-color: whitesmoke;">
        <div class="inside-card">
            <span class="dashboard-text">회원관리</span>
        </div>
          <hr>
          <table class="table-tag">
              <tr class="table-trs">
                  <th class="table-ths"><input type="checkbox" id="member-check-all"></th>
                  <th class="table-ths">아이디</th>
                  <th class="table-ths">닉네임</th>
                  <th class="table-ths">가입일</th>
              </tr>
              <tr class="table-trs">
                  <td class="table-tds"><input type="checkbox" class="member-checkbox"> </td>
                  <td class="table-tds">sadf</td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">asdf</td>
              </tr>
              <tr class="table-trs">
                  <td class="table-tds"><input type="checkbox" class="member-checkbox"> </td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">asdf</td>
              </tr>
              <tr class="table-trs">
                  <td class="table-tds"><input type="checkbox" class="member-checkbox"> </td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">sadf</td>
                  <td class="table-tds">asdf</td>
              </tr>
              <tr class="table-trs">
                  <td class="table-tds"><input type="checkbox" class="member-checkbox"> </td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">asdf</td>
                  <td class="table-tds">asfd</td>
              </tr>
          </table>
          <div class="pagination-area">
          <a href="">이전</a>
          <a href="">1</a>
          <a href="">2</a>
          <a href="">3</a>
          <a href="">4</a>
          <a href="">5</a>
          <a href="">다음</a>
          </div>
      </div>
                <%--     각 디브끼리 떼어놓기     --%>
            <div id="empty-div-for-padding"></div>

            <div class="dashboard" id="some-dashboard" style="background-color: whitesmoke">
                <div class="inside-card">
                    <span class="dashboard-text" >SOME</span>
                </div>
                <hr>
                <table class="table-tag">
                    <tr class="table-trs">
                        <th class="table-ths"><input type="checkbox" id="some-check-all"></th>
                        <th class="table-ths">아이디</th>
                        <th class="table-ths">닉네임</th>
                        <th class="table-ths">가입일</th>
                    </tr>
                    <tr class="table-trs">
                        <td class="table-tds"><input type="checkbox" class="some-checkbox"> </td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                    </tr>
                    <tr class="table-trs">
                        <td class="table-tds"><input type="checkbox" class="some-checkbox"> </td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                    </tr>
                    <tr class="table-trs">
                        <td class="table-tds"><input type="checkbox" class="some-checkbox"> </td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                    </tr>
                    <tr class="table-trs">
                        <td class="table-tds"><input type="checkbox" class="some-checkbox"> </td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                        <td class="table-tds">some</td>
                    </tr>
                </table>
                <div class="pagination-area">
                    <a href="">이전</a>
                    <a href="">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">다음</a>
                </div>
            </div>

    </div>
</div>
</body>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</html>
<script src="${rootContext}/resources/js/admin/admin-script.js"></script>

<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">
<link rel="stylesheet" href="${rootContext}/resources/css/admin/admin-dashboard-style.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/footer-stick-to-bottom.css">
