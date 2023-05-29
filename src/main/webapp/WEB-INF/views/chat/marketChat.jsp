<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>채팅</h1>
	
	<input type="text" name="message">
	<button onclick="sendMessage();">전송</button>
	
	<script>

		//웹소켓 생성
		const socket = new WebSocket("ws://127.0.0.1:8888/lively/server");

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
			const chat = JSON.parse(event.data);  //event.data : 데이터 덩어리
			console.log("발신자 : " + chat.sender);
			console.log("메세지 : " + chat.MsgContent);
			console.log("마켓번호 : " + chat.roomNo);
		}

		//메세지 발신
		function sendMessage(){
			const message = document.querySelector("input[name=message]");
			socket.send(message);
		}
	</script>

</body>
</html>