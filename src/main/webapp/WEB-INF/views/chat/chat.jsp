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
  <body>
    
      <div id="wrap">

        <main>
            <div class="header">
                CHAT
            </div>

 <!--            <div class="chat_wrap">
                <div class="chat ch1">
                    <div class="icon"><i class=""></i></div>
                    <div class="textbox">안녕하세요! </div>
                </div>
                <div class="chat ch2">
                    <div class="icon"><i class=""></i></div>
                    <div class="textbox">안녕하세요~ </div>
                </div>
                <div class="chat ch1">
                    <div class="icon"><i class=""></i></div>
                    <div class="textbox">요즘 어떻게 지내세요?</div>
                </div>
                <div class="chat ch2">
                    <div class="icon"><i class=""></i></div>
                    <div class="textbox">잘 지내고 있어요 ㅎㅎ</div>
                </div>
            </div> -->
            <div class="input_div">
                <textarea placeholder="Press Enter for send message."></textarea>
            </div>
            <div class="chat format">
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
    </div>
        </main>

    </div>

</body>
</body>
</html>
    <link rel="stylesheet" href="${rootContext}/resources/css/chat/chat.css">
    <script src="${rootContext}/resources/js/chat/chat.js"></script>
