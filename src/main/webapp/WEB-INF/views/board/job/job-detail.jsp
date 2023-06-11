<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB</title>
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
				<a href="${rootContext}/job/list" id="list-btn">목록</a>
				<div id="detail-area">
					<div id="detail-title">제목</div>
					<div id="detail-inTitle">${jvo.title}</div>
					<div id="detail-date">작성일자</div>
					<div id="detail-inDate">${jvo.enrollDate}</div>
					<div id="detail-hit">조회수</div>
					<div id="detail-inHit">${jvo.views}</div>
					<div id="detail-content">내용</div>
					<div id="detail-inContent">${jvo.content}
					<br>
							<c:forEach items="${jvo.attList}" var="image">
								<img
									src="${rootContext}/resources/upload/job/${image.changeName}"
									width="150px" height="150px" />
							</c:forEach>
					</div>
				</div>

				<c:if test="${memberLog.no eq jvo.writer || adminLog.adminId == 'admin'}">
				<button id="write_submit_delete"
					onclick="location.href='${rootContext}/job/delete?no=${jobNo}'">
					<span>삭제하기</span>
				</button>
				</c:if>
				
				<c:if test="${memberLog.no eq jvo.writer}">
				<button id="write_submit_edit" onclick="toggleActive();">
					<span>수정하기</span>
				</button>
				</c:if>
			<div id="comment-header">
				<input type="text" name="content" placeholder="댓글을 입력하세요">
				<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
			</div>
			<div id="comment-area"></div>

			</div>
			<!-- 수정화면 -->
			<div class="form-area active">
        <form action="${rootContext}/job/edit?no=${jvo.jobNo}" method="POST" enctype="multipart/form-data">
            <div class="write-board">

                <h3 id="friend-title">JOB</h3>

						<div id="jobcategory">
						<input type="radio" name="jobCategoryNo" value="1"
							id="jobCategory1" checked> <label for="jobCategory1" >구인</label> 
							<input type="radio" name="jobCategoryNo" value="2" id="jobCategory2">
						<label for="jobCategory2">구직</label>
						</div>
						
                		<%--지역 --%>
                		<select class="location-option" name="locationNo" id="location">
  							<c:forEach items="${locationList}" var="location">
    							<option value="${location.getLocationNo()}">${location.getLocationName()}</option>
  							</c:forEach>
						</select>

                <div class="xform__group">
                	<input type="text" name="jobNo" value="${jvo.jobNo}" style="display: none">
                	<input type="text" name="writer" value="${jvo.writer}" style="display: none">
                    <input type="text" name="title" class="form__field" placeholder="제목" required value="${jvo.title}">
                </div>
            <div class="write-group">
                            <textarea name="content" id="content" cols="30" rows="10" style="resize: none"
                            placeholder="내용" required>${jvo.content}</textarea>
            </div>
		
            <div class="register">
                    <div id="registerName" onclick="location.href='${rootContext}/job/list'"><input value="취소" type="button"></div>
                    <div id="registerName"><input value="수정" type="submit"></div>
                </div>
            </div>
        </form>
    </div>



			<footer>
				<%@ include file="/WEB-INF/views/common/footer.jsp"%>
			</footer>

		</main>

	</div>
	<!-- div wrap end -->

</body>
</html>

<script>


function toggleActive() {
	  const viewArea = document.querySelector(".view-area");
	  const formArea = document.querySelector(".form-area");

	  viewArea.classList.remove('active');
	  formArea.classList.add('active');
	  
	  viewArea.style.display = "none";
	  formArea.style.display = "block";
	}
    
const div = document.querySelector('#thumbnail-area');
	
	let imgTag;
	let aTag;
	<c:forEach items="${jvo.attList}" var="fvo">
		//a태그 만들기
		aTag = document.createElement('a');
		aTag.href = "${root}/board/att/down?ano=${fvo.no}";
		//이미지 요소 만들기
		imgTag = document.createElement('img');
		imgTag.setAttribute("src" , "${root}/${path}/${fvo.changeName}");
		imgTag.setAttribute("alt" , "${fvo.originName}");
		imgTag.setAttribute("width" , "100px");
		imgTag.setAttribute("height" , '100px');

		//a태그 내부에 img 추가
		aTag.appendChild(imgTag);

		//div 안에 a태그 추가
		div.appendChild(aTag);
	</c:forEach>
    
	
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
			url : '${rootContext}/job/reply/write' ,
			type : 'POST' ,
			data : {
				'jobNo' : '${jvo.jobNo}' ,
				'content' : content ,
			} , 
			success : function(data){
				if(data == 'ok'){
					 alert("댓글 작성 완료 !");
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
			url : '${rootContext}/job/reply/list' ,
			type  : 'get' ,
			data : {
				'jobNo' : '${jvo.jobNo}'	
			} ,
			dataType : 'json' ,
			success : function(data){
				console.log(data);

				for(let replyVo of data){
					let str = "";
					str += "<div>";
					str += replyVo.content;
					str += "</div>";
					str += "<div>";
					str += replyVo.enrollDate;
					str += "</div>";
					str += "<div>";
					str += "<span>"
					 str += replyVo.writerName;
					str += "</span>"
					if(writer == replyVo.writer){
						str += "<button class='btn btn-danger btn-sm' onclick='deleteReply(" + replyVo.jobReplyNo + ");'>삭제</button>";
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
			url : '${rootContext}/job/reply/delete?rno=' + rno ,
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
<link rel="stylesheet"
	href="${rootContext}/resources/css/board/job/job-detail.css">
<link rel="stylesheet"
	href="${rootContext}/resources/css/common/wrap-style.css" />