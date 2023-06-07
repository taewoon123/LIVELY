<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<header>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <%@ include file="/WEB-INF/views/common/alertMsg.jsp"%>
</header>
<body>

<div id="wrap">
    <main>

        <br>

        <div class="view-area active">
            <a href="${rootContext}/fund/list" id="list-btn">목록</a>
           <div id="money-area">
               <h1  class="fund-no">${fundDetail.fundraiseNo}</h1>
               <div class="money-goal">목표 금액</div>
               <div class="money-goal money-goal-target">₩${fundDetail.moneyGoal}</div>
               <div class="current-money">현재 금액</div>
               <div class="current-money current-money-target">₩${fundDetail.money}</div>
               <!--<button class="donate btn custom-btn">기부 하기</button>-->

               <form action="${rootContext}/fund/donate" method="post">
               <div class="donate-input">
                   <input type="text" name="donateMoney" class="" placeholder="기부할 금액(숫자)을 입력해주세요.">
                   <input type="text" name="fundNo" value="${fundDetail.fundraiseNo}" style="display: none">
                   <input type="submit" class="btn custom-btn donate-hide donate-button" value="기부 하기">
               </div>
               </form>

               <div class="progress-bar">
                    <div class="progress"></div>
               </div>
           </div>
            <div id="help-area">
                <div id="help-title">제목</div>
                <div id="help-inTitle">${fundDetail.title}</div>
                <div id="help-date">작성일자</div>
                <div id="help-inDate">${fundDetail.enrollDate}</div>
                <div id="help-hit">조회수</div>
                <div id="help-inHit">${fundDetail.views}</div>
                <div id="help-content">내용</div>
                <div id="help-inContent">${fundDetail.content}
                    <br>
                    <c:forEach items="${fundDetail.attList}" var="image">
                    <img src="${rootContext}/resources/upload/fundraise/${image.changeName}" width="200px" height="200px"/>
                    </c:forEach>
                </div>
            </div>

            <c:if test="${sessionScope.memberLog.no eq fundDetail.writer }">
                <!-- 작성 버튼 -->
                <button id="write_submit_delete" onclick="location.href='${rootContext}/fund/delete?no=${fundNo}'">
                    <span>삭제하기</span>
                </button>

                <button id="write_submit_edit" onclick="location.href='${rootContext}/fund/edit?no=${fundNo}'">
                    <span>수정하기</span>
                </button>
            </c:if>


        </div>

        <div id="comment" style="visibility: hidden">
            <input id="comment-input" name="comment" placeholder="댓글을 입력해 주세요.">
            <button id="submit" name="comment">등록</button>
        </div>

        <!-- js때문에 있어야함. -->
        <div id="comments"></div>

        <footer>
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
        </footer>

    </main>

</div> <!-- div wrap end -->

</body>
<script>
    if(${alertMsg != null}){
        alert("${alertMsg}");
    }

const fundNo = document.querySelector(".fund-no").innerText;
console.log(fundNo);
</script>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>
<script src="${rootContext}/resources/js/board/fundraise/fund-detail-progress-bar.js"></script>
<script src="${rootContext}/resources/js/board/fundraise/fund-detail-donate.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
