<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 채팅입력창 */
.input_div { 
  position: fixed; 
  bottom: 0; 
  width: 100%;
  height: 50px;  
  background-color: #FFF; 
  text-align: center; 
  border-top: 1px solid #078735; 
}
.input_div > input { 
  width: 100%; 
  height: 70px; 
  border: none; 
  padding: 10px; 
}
/* 메인크기조절 */
#wrap{
    /* position: relative; */
}


/* CHAT헤더 */
.header {
   font-size: 14px; 
   padding: 15px 0; 
   background: #078735; 
   color: white; 
   text-align: center;  
}

/* 원래 있던거 */
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}


#chat-content {
	font-weight: bold;
}

#chat-date {
	font-size: 12px;
	color: grey;
}

</style>
<body>

	<div id="wrap">
        
        <main>
            <div class="header">
                CHAT
            </div>

			<!-- <form action="" onsubmit="return sendMessage();"> -->
	            <div class="input_div">
	                <input placeholder="Press Enter for send message." type="text" name="message" class="chatMessage">
	                <button type="submit" id="sendBtn" onclick="sendMessage();">전송</button>
	            </div>
            <!-- </form> -->
			
			<div id="chat-area" class="chatArea">
				<!-- <div id="chat-content"></div>
				<div id="chat-date"></div> -->
			</div>
			
			<input type="hidden" class="loginMember" value="${memberLog.id}">
			
		</main>
	</div>
			
	<script>

		//웹소켓 생성
		const socket = new WebSocket("ws://127.0.0.1:8888/lively/market/server");

		//핸들러로 연결
		socket.onopen = connectOk;
		socket.onerror = connectFail;
		socket.onclose = disconnect;
		socket.onmessage = receiveMessage;

		//웹소켓 연결 성공
		function connectOk(){
			console.log('연결 성공');
		}

		//웹소켓 연결 실패
		function connectFail(){
			console.log('연결 실패');
		}

		//웹소켓 끊김
		function disconnect(){
			console.log('연결 끊김');
		}

		//메세지 수신
		function receiveMessage(event){
			console.log('메세지 수신');
			console.log(event);
			const chat = JSON.parse(event.data);  //event.data : 데이터 덩어리
			console.log("발신자 : " + chat.sender);
			console.log("메세지 : " + chat.msgContent);
			console.log("마켓번호 : " + chat.roomNo);
			console.log("보낸시각 : " + chat.msgTime);
			
			const chatArea = document.querySelector("#chat-area");
			const chatContent = document.querySelector("#chat-content");
			const chatDate = document.querySelector("#chat-date");
			/* chatArea.innerHTML +=  chat.sender + " : " + chat.msgContent  + " " + "<br>" + chat.msgTime  + "<br>"; */
			/* chatContent.innerHTML +=  chat.sender + " : " + chat.msgContent;
			chatDate.innerHTML += chat.msgTime + "<br>"; */
			chatArea.innerHTML += "<div id='chat-content'>" + chat.sender + " : " + chat.msgContent + "</div>"
									+ "<div id='chat-date'>" + chat.msgTime + "</div>" + "<br>";
		}

		//메세지 발신
		function sendMessage(){
			const message = document.querySelector("input[name=message]").value;
			socket.send(message);
		}
		
		
		
		//enter
		const chatMessage = document.querySelector(".chatMessage");
		chatMessage.addEventListener("keydown",(event) => {
		    if(event.keyCode == 13){
		        event.preventDefault();
		        document.querySelector('#sendBtn').click();
		    }
		});
		

	</script>

</body>
    <link rel="stylesheet" href="${rootContext}/resources/css/chat/chat.css">
</html>
