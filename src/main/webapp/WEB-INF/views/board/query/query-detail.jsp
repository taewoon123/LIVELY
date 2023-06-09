<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판 상세</title>
</head>
<body>

	<div id="wrap">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/common/alertMsg.jsp"%>

		<main>

			<br>

			<div class="view-area active">
				<a href="${rootContext}/query/list" id="list-btn">목록</a>
				<div id="help-area">
						<div id="help-title">제목</div>
						<div id="help-inTitle">${qvo.title}</div>
						<%-- <div id="help-harea">지역</div>
						<div id="help-inharea">${qvo.locationName}</div> --%>
						<div id="help-date">작성일자</div>
						<div id="help-inDate">${qvo.enrollDate}</div>
						<div id="help-hit">조회수</div>
						<div id="help-inHit">${qvo.views}</div>
						<div id="help-content">내용</div>
						<div id="help-inContent">${qvo.content}
							<br>
							<c:forEach items="${qvo.attList}" var="image">
								<img
									src="${rootContext}/resources/upload/query/${image.changeName}"
									width="150px" height="150px" />
							</c:forEach>
						</div> <!-- query-inContent end -->
				</div>

				<!-- 작성 버튼 -->
				<c:if test="${memberLog.name eq qvo.writer }">
					<button id="write_submit_delete"
						onclick="location.href='${rootContext}/query/delete?num=${queryNo}'">
						<span>삭제하기</span>
					</button>
					<span style="color: whitesmoke">${queryNo}</span>

					<button id="write_submit_edit"
						onclick="location.href='${rootContext}/query/edit?num=${queryNo}'">
						<span>수정하기</span>
					</button>
				</c:if>

			</div>

			<div id="comment-header">
				<input type="text" name="content" placeholder="댓글을 입력하세요">
				<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
			</div>

			<div id="comment-area"></div>

			<footer>
				<%@ include file="/WEB-INF/views/common/footer.jsp"%>
			</footer>

		</main>

	</div>
	<!-- div wrap end -->

</body>
<script>
function writeComment(){
	//로그인 안되어있으면 ㄴㄴ
	const writer = '${memberLog.no}';
	if(writer <= 0){
		alert("로그인 후 작성 가능합니다.");
		return;
	}

	//ajax 이용해서 서버에 댓글내용 보내기
	const content = document.querySelector('input[name=content]').value;
	
	$.ajax({
		url : '${rootContext}/query/reply/write' ,
		type : 'POST' ,
		data : {
			'queryNo' : '${qvo.queryNo}' ,
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
			alert('bad...');
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
		url : '${rootContext}/query/reply/list' ,
		type  : 'get' ,
		data : {
			'queryNo' : '${qvo.queryNo}'	
		} ,
		dataType : 'json' ,
		success : function(data){
			console.log(data);

			for(let queryReplyVo of data){
				let str = "";
				str += "<div>";
				str += queryReplyVo.content;
				str += "</div>";
				str += "<div>";
				str += queryReplyVo.enrollDate;
				str += "</div>";
				str += "<div>";
				str += "<span>"
				 str += queryReplyVo.writerName;
				str += "</span>"
				if(writer == queryReplyVo.writer){
					str += "<button class='comment-delete' onclick='deleteReply(" + queryReplyVo.queryReplyNo + ");'>삭제</button>";
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
		url : '${rootContext}/query/reply/delete?rno=' + rno ,
		type : 'delete' ,
		success : function(data){
			console.log(data);
			loadReply();
		} ,
		error : function(error){
			console.log(error);
			alert("댓글 삭제에 실패하였습니다.");
		} ,
	});

}
</script>
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-detail.css">
</html>