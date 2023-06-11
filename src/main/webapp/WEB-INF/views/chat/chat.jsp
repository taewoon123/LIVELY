<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" 
    pageEncoding="UTF-8"%>
<c:set var="rootContext" value="${pageContext.request.contextPath}" scope="page" />
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chat</title>
</head>

<body>
    
    <div id="wrap">
        
        <main>
            <div class="header">
                CHAT
            </div>
            <div class="chat format">
        		<div id="chat_wrap"></div>
            </div>
            <form action="" onsubmit="return sendMessage();">
	            <div class="input_div">
	                <!-- <textarea placeholder="Press Enter for send message." ></textarea> -->
	                <input placeholder="Press Enter for send message." type="text" name="message">
	                <button type="submit" id="sendBtn">전송</button>
	            </div>
            </form>
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
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
		chatArea.innerHTML +=  chat.roomNo + " : " + chat.msgContent + " (" + chat.sender + ") " + " " + chat.msgTime  + "<br>";
	}

	//메세지 발신
	function sendMessage(){
		const message = document.querySelector("input[name=message]").value;
		socket.send(message);
	}
	
	
	//
	
	
//엔터키
$(document).ready(function() {
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();
		}
		event.stopPropagation();
	});
	$('#message').click(function(){send();});
});

</script>

</body>
</html>
    <link rel="stylesheet" href="${rootContext}/resources/css/chat/chat.css">
    <%-- <script src="${rootContext}/resources/js/chat/chat.js"></script> --%>
