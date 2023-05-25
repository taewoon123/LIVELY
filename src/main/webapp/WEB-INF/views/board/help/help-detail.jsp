<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

	<div id="wrap">
		<main>

			<br>

			<div class="view-area active">
				<a href="${rootContext}/help/list" id="list-btn">목록</a>
				<div id="help-area">
					<div id="help-title">제목</div>
					<div id="help-inTitle">${hvo.title}</div>
					<div id="help-date">작성일자</div>
					<div id="help-inDate">${hvo.enrollDate}</div>
					<div id="help-hit">조회수</div>
					<div id="help-inHit">${hvo.views}</div>
					<div id="help-content">내용</div>
					<div id="help-inContent">${hvo.content}</div>
				</div>
				
					<div>
						<label for="thumbnail-tag">사진</label>
						<input id="thumbnail-tag" type="file" name="f" multiple accept=".jpg,.png,.jpeg">
					</div>
					<div id="thumbnail-area"></div>

				<!-- 작성 버튼 -->
				<c:if test="${memberLog.id eq hvo.writer }">
				<button id="write_submit_delete" onclick="location.href='${rootContext}/help/delete?num=${helpNo}'">
					<span>삭제하기</span>
				</button>
				<span style="color: whitesmoke">${HelpNo}</span>

				<button id="write_submit_edit">
					<span>수정하기</span>
				</button>
				</c:if>

			</div>

			<div id="comment">
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
</html>
<script>

    function toggleActive(){
        const viewArea = document.querySelector(".view-area");
        const formArea = document.querySelector(".form-area");

        viewArea.classList.remove('active');
        formArea.classList.add('active');
    }
    
const div = document.querySelector('#thumbnail-area');
	
	let imgTag;
	let aTag;
	<c:forEach items="${hvo.attList}" var="fvo">
		//a태그 만들기
		aTag = document.createElement('a');
		aTag.href = "${root}/board/att/down?ano=${fvo.no}";
		//이미지 요소 만들기
		imgTag = document.createElement('img');
		imgTag.setAttribute("src" , "${rootContext}/${path}/${fvo.changeName}");
		imgTag.setAttribute("alt" , "${fvo.originName}");
		imgTag.setAttribute("width" , "100px");
		imgTag.setAttribute("height" , '100px');

		//a태그 내부에 img 추가
		aTag.appendChild(imgTag);

		//div 안에 a태그 추가
		div.appendChild(aTag);
	</c:forEach>
    
</script>

<script src="${rootContext}/resources/js/board/comment-detail.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-detail.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />