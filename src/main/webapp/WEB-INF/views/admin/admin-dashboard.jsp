<%--
  Created by IntelliJ IDEA.
  User: b9
  Date: 2023-04-24
  Time: 15:05
  To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>


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
                  <th class="table-ths hidden-no" style="display: none">NO</th>
                  <th class="table-ths">아이디</th>
                  <th class="table-ths">닉네임</th>
                  <th class="table-ths">가입일</th>
              </tr>
              <c:forEach items="${memberList}" var="member">
                  <tr class="table-trs">
                      <td class="table-tds"><input type="checkbox" class="member-checkbox"></td>
                      <th class="table-ths hidden-no" style="display: none">${member.no}</th>
                      <td class="table-tds">${member.id}</td>
                      <td class="table-tds">${member.name}</td>
                      <td class="table-tds">${member.joinDate}</td>
                  </tr>
              </c:forEach>
<%--      삭제 버튼      --%>
            <button id="deleteMemberButton">삭제</button>
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
<script>

    if (${adminLog == null}) {
        alert("관리자 로그인이 필요합니다.");
        location.href = "${rootContext}/main";
    }
   if(${memberDeleteAlert != null}){
   alert("${memberDeleteAlert}");
   }
    <%
        session.removeAttribute("memberDeleteAlert");
    %>
</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</html>
<script src="${rootContext}/resources/js/admin/admin-script.js"></script>

<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">
<link rel="stylesheet" href="${rootContext}/resources/css/admin/admin-dashboard-style.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/footer-stick-to-bottom.css">
