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
            <form action="" onsubmit="return sendMsg();">
	            <div class="input_div">
	                <!-- <textarea placeholder="Press Enter for send message." ></textarea> -->
	                <input placeholder="Press Enter for send message." type="text" name="msg">
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

</body>
</html>
    <link rel="stylesheet" href="${rootContext}/resources/css/chat/chat.css">
    <script src="${rootContext}/resources/js/chat/chat.js"></script>
