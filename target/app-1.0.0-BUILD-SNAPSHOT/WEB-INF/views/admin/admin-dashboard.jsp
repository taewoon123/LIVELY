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
      <div class="dashboard" style="background-color: whitesmoke">
        <div class="inside-card">
            <span class="dashboard-text" >회원관리</span>
        </div>
          <hr>
          <table id="member-table">
              <tr class="member-table-tr">
                  <th class="member-table-th"><input type="checkbox" id="check-all"></th>
                  <th class="member-table-th">아이디</th>
                  <th class="member-table-th">닉네임</th>
                  <th class="member-table-th">가입일</th>
              </tr>
              <tr class="member-table-tr">
                  <td class="member-table-td"><input type="checkbox"> </td>
                  <td class="member-table-td">sadf</td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">asdf</td>
              </tr>
              <tr class="member-table-tr">
                  <td class="member-table-td"><input type="checkbox"> </td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">asdf</td>
              </tr>
              <tr class="member-table-tr">
                  <td class="member-table-td"><input type="checkbox"> </td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">sadf</td>
                  <td class="member-table-td">asdf</td>
              </tr>
              <tr class="member-table-tr">
                  <td class="member-table-td"><input type="checkbox"> </td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">asdf</td>
                  <td class="member-table-td">asfd</td>
              </tr>
          </table>
          <div id="pagination-area">
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
<link rel="stylesheet" href="${rootContext}/resources/css/admin/admin-dashboard-style.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/footer-stick-to-bottom.css">
