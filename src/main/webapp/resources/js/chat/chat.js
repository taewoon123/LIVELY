var socket;
//웹소켓 생성

function connect(){
	socket = new WebSocket("ws://127.0.0.1:8888/lively/server");
	socket.onopen = connectOk;
	socket.onmessage = rcvMsg;
	socket.onclose = disconnect;
	socket.onerror = connectFail;
	
}

//웹소켓 연결 성공
function connectOk(event){
		appendMessage("연결되었습니다.");
}

//웹소켓 연결 실패
function connectFail(){
	console.log('연결 실패ㅠ');
}

//웹소켓 끊김
function disconnect(event){
	appendMessage("연결이끊겼습니다.");
	socket.close();
}



// 메세지 전송
function sendMsg() {
	var name = val();
	var msg = $("#msg").val();
	socket.sendMsg("msg"+name+":" + msg);
	$("#msg").val("");
}

function appendMessage(msg) {
	$("#chat_wrap").append(msg+"<br>");

	
}

//메세지 수신
function rcvMsg(event){
//	console.log('메세지 수신');
//	const socketServer = JSON.parse(event.data);
//	console.log("발신자 : " + socketServer.sender);
//	console.log("메세지 : " + socketServer.msgContent);
//	console.log("전송시각 : " + socketServer.msgTime);
	var data = event.data;
	if (data.substring(0 , 4) == "msg:"){
		appendMessage(data.substring(4));
	}
}


//엔터키
$(document).ready(function() {
	$('#msg').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();
		}
		event.stopPropagation();
	});
	$('#msg').click(function(){send();});
});


/*
//채팅 구현
const Chat = (function(){
    const myName = "blue";
 
    // init 함수
    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function(e){
            if(e.keyCode == 13 && !e.shiftKey) {
                e.preventDefault();
                const msg = $(this).val();
 
                // 메시지 전송
                sendMsg(msg);
                // 입력창 clear
                clearTextarea();
            }
        });
    }
 
    // 메세지 태그 생성
    function createMessageTag(LR_className, senderName, message) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 
        // 값 채우기
        chatLi.addClass(LR_className);
        chatLi.find('.sender span').text(sender);
        chatLi.find('.message span').text(message);
 
        return chatLi;
    }
 
    // 메세지 태그 append
    function appendMessageTag(LR_className, sender, message) {
        const chatLi = createMessageTag(LR_className, sender, message);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }
 
 
    // 메세지 입력박스 내용 지우기
    function clearTextarea() {
        $('div.input-div textarea').val('');
    }
 
    // 메세지 수신
    function resive(data) {
        const LR = (data.sender != requestor)? "left" : "right";
        appendMessageTag("right", data.sender, data.message);
    }
 
    return {
        'init': init
    };
})();
 
$(function(){
    Chat.init();
});
*/
