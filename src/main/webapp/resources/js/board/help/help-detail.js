//function toggleActive(){
//        const viewArea = document.querySelector(".view-area");
//        const formArea = document.querySelector(".form-area");
//
//        viewArea.classList.remove('active');
//        formArea.classList.add('active');
//    }
//    
//    function writeComment(){
//		//로그인 안되어있으면 ㄴㄴ
//		const writer = '${memberLog.no}';
//		if(writer <= 0){
//			alert("로그인 후 작성 가능합니다.");
//			return;
//		}
//
//		//ajax 이용해서 서버에 댓글내용 보내기
//		const content = document.querySelector('input[name=content]').value;
//		
//		$.ajax({
//			url : '${rootContext}/help/reply/write' ,
//			type : 'POST' ,
//			data : {
//				'helpNo' : '${hvo.helpNo}' ,
//				'content' : content ,
//			} , 
//			success : function(data){
//				if(data == 'ok'){
//					 alert("댓글 작성 완료 !");
//					document.querySelector('input[name=content]').value = '';
//					loadReply();
//				}else if(data == 'unauthor'){
//					alert("로그인 후 작성 가능합니다.");
//				}else{
//					alert("댓글 작성 실패 ..."); 
//				}
//			} , 
//			error : function(){
//				alert('bad...');
//			} ,
//		});
//	}
//	
//	
//	//댓글 불러오기
//	loadReply();
//
//	function loadReply(){
//
//		const commentArea = document.querySelector('#comment-area');
//		commentArea.innerHTML = '';
//		const writer = '${memberLog.no}';
//		
//		$.ajax({
//			url : '${rootContext}/help/reply/list' ,
//			type  : 'get' ,
//			data : {
//				'helpNo' : '${hvo.helpNo}'	
//			} ,
//			dataType : 'json' ,
//			success : function(data){
//				console.log(data);
//
//				for(let HelpReplyVo of data){
//					let str = "";
//					str += "<div>";
//					str += HelpReplyVo.content;
//					str += "</div>";
//					str += "<div>";
//					str += HelpReplyVo.enrollDate;
//					str += "</div>";
//					str += "<div>";
//					str += "<span>"
//					 str += HelpReplyVo.writerName;
//					str += "</span>"
//					if(writer == HelpReplyVo.writer || writer == '${writerName}' ){
//						str += "<button class='btn btn-warning btn-sm' onclick='editReply(" + HelpReplyVo.helpNo + ");'>수정</button>";
//						str += "<button class='btn btn-danger btn-sm' onclick='deleteReply(" + HelpReplyVo.helpNo + ");'>삭제</button>";
//					} 
//					str += "</div>";
//					commentArea.innerHTML += str;
//				}
//
//			} ,
//			error : function(error){
//				console.log(error);
//			} ,
//		});
//
//	}