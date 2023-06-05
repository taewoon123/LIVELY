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
            <button id="deleteMemberButton" class="btn-close-white">삭제</button>
          </table>

          <div class="page-area">
              <div class="pagination-custom">
                  <c:if test="${pageVo.currentPage > 1}">
                      <a class="prev page-numbers" href="${rootContext}/admin/dashboard?page=${pageVo.currentPage-1}"> << </a>
                  </c:if>
                  <c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" step="1" var="i">
                      <c:if test="${pageVo.currentPage != i}">
                          <a class="page-numbers" href="${rootContext}/admin/dashboard?page=${i}">${i}</a>
                      </c:if>
                      <c:if test="${pageVo.currentPage == i}">
                          <a class="page-numbers">${i}</a>
                      </c:if>
                  </c:forEach>
                  <c:if test="${pageVo.currentPage < pageVo.maxPage}">
                      <a class="next page-numbers" href="${rootContext}/admin/dashboard?page=${pageVo.currentPage+1}"> >> </a>
                  </c:if>
              </div>
          </div>

      </div>


                <%--     각 디브끼리 떼어놓기     --%>
            <div id="empty-div-for-padding"></div>

            <div class="dashboard" id="some-dashboard" style="background-color: whitesmoke">
                <div class="inside-card">
                    <span class="dashboard-text">사이트 현황</span>
                </div>
                <hr>
                <table class="table-tag">
                    <tr class="table-trs">
                        <th class="table-tds" style="text-align: center;" colspan="2">사이트 현황</th>
                    </tr>
                    <tr class="table-trs">
                        <th class="table-tds">총 회원 수</th>
                        <td class="table-tds">${memberCount} (명)</td>
                    </tr>
                    <tr class="table-trs" >
                        <th class="table-tds" onclick="location.href='${rootContext}/query/list'">질문 게시판</th>
                        <td class="table-tds">${queryCount} (개)</td>
                    </tr>
                    <tr class="table-trs" >
                        <th class="table-tds" onclick="location.href='${rootContext}/help/list'">도움 게시판</th>
                        <td class="table-tds">${helpCount} (개)</td>
                    </tr>
                    <tr class="table-trs" >
                        <th class="table-tds" onclick="location.href='${rootContext}/job/list'">구인구직 게시판</th>
                        <td class="table-tds">${jobCount} (개)</td>
                    </tr>
                    <tr class="table-trs">
                        <th class="table-tds" onclick="location.href='${rootContext}/fund/list'">기부 게시판</th>
                        <td class="table-tds">${fundCount} (개)</td>
                    </tr>
                    <tr class="table-trs" >
                        <th class="table-tds" onclick="location.href='${rootContext}/market/list'">중고장터</th>
                        <td class="table-tds">${marketCount} (개)</td>
                    </tr>
                    <tr class="table-trs" >
                        <th class="table-tds" onclick="location.href='${rootContext}/friend/list'">친구 게시판</th>
                        <td class="table-tds">${friendCount} (개)</td>
                    </tr>
<%--                    <a href="${rootContext}/notice/list" class="btn custom-btn d-lg-block d-none">Notice 바로가기</a>--%>
                    <button onclick="location.href='${rootContext}/notice/list'" class="btn custom-btn">Notice 바로가기</button>
                    <br>
                </table>
            </div>

    </div>
</div>
</body>
<script>

    if (${adminLog == null and adminLog.adminId != "superuser"}) {
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
