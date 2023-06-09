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
               <div class="money-goal">목표 금액</div>
               <div class="money-goal money-goal-target">₩${fundDetail.moneyGoal}</div>
               <div class="current-money">현재 금액</div>
               <div class="current-money current-money-target">₩${fundDetail.money}</div>
               <!--<button class="donate btn custom-btn">기부 하기</button>-->

               <form action="${rootContext}/fund/donate" method="post">
               <div class="donate-input">
                   <input type="number" name="donateMoney" class="" placeholder="기부할 금액(숫자)을 입력해주세요.">
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

            <div id="comment-header">
                <input type="text" name="content" placeholder="댓글을 입력하세요">
                <button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
            </div>

            <div id="comment-area">

            </div>


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

    //Comment Below
     function toggleActive(){
         const viewArea = document.querySelector(".view-area");
         const formArea = document.querySelector(".form-area");
    
         viewArea.classList.remove('active');
         formArea.classList.add('active');
     }

    function writeComment(){
        //로그인 안되어있으면 안됨.
        const writer = '${memberLog.no}';
        if(writer <= 0){
            alert("로그인 후 작성 가능합니다.");
            return;
        }

        //ajax 이용해서 서버에 댓글내용 보내기
        const content = document.querySelector('input[name=content]').value;

        $.ajax({
            url : '${rootContext}/fund/reply/write' ,
            type : 'POST' ,
            data : {
                'fundNo' : ${fundDetail.fundraiseNo} ,
                'content' : content ,
            } ,
            success : function(data){
                if(data == 'ok'){
                    document.querySelector('input[name=content]').value = '';
                    loadReply();
                }else if(data == 'unauthor'){
                    alert("로그인 후 작성 가능합니다.");
                }else{
                    alert("댓글 작성 실패 ...");
                }
            } ,
            error : function(){
                alert('Error Occurred while writing comment');
            } ,
        });
    }


    //댓글 불러오기
    loadReply();

    function loadReply(){

        const commentArea = document.querySelector('#comment-area');
        commentArea.innerHTML = '';
        const writer = '${memberLog.no}';

        $.ajax({
            url : '${rootContext}/fund/reply/list' ,
            type  : 'get' ,
            data : {
                'fundNo' : '${fundDetail.fundraiseNo}'
            } ,
            dataType : 'json' ,
            success : function(data){
                console.log(data);

                for(let FundraiseReplyVo of data){
                    let str = "";
                    str += "<div>";
                    str += FundraiseReplyVo.content;
                    str += "</div>";
                    str += "<div>";
                    str += FundraiseReplyVo.enrollDate;
                    str += "</div>";
                    str += "<div>";
                    str += "<span>"
                    str += FundraiseReplyVo.writerName;
                    str += "</span>"
                    if(writer == FundraiseReplyVo.writer){
                        str += "<button class='comment-delete' onclick='deleteReply(" + FundraiseReplyVo.fundReplyNo + ");'>삭제</button>";
                    }
                    str += "</div>";
                    commentArea.innerHTML += str;
                }

            } ,
            error : function(error){
                console.log(error);
            } ,
        });

    }

    //댓글 삭제
    function deleteReply(rno){

        const result = confirm("댓글을 삭제하시겠습니까?");
        if(!result){
            return;
        }

        $.ajax({
            url : '${rootContext}/fund/reply/delete?rno=' + rno ,
            type : 'delete' ,
            success : function(data){
                console.log(data);
                alert("댓글이 삭제되었습니다");
                loadReply();
            } ,
            error : function(error){
                console.log(error);
                alert("댓글 삭제에 실패하였습니다.");
            } ,
        });

    }

</script>
</html>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>
<script src="${rootContext}/resources/js/board/fundraise/fund-detail-progress-bar.js"></script>
<script src="${rootContext}/resources/js/board/fundraise/fund-detail-donate.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/fundraise/fundraise-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
