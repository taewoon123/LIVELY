<%@ page language="java"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main>
            <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                </div>
                <div id="img_area">
                    <img src="${rootContext}/resources/img/dog2.jpg" alt="사진">
                </div>
                <div id="content_area">
                    <a>같이 밥 먹을 친구 구함.</a>
                </div>
                <div id="chat_area">
                    <button> <a>CHAT</a></button>
                </div>
            </div>

            <br><br>

            <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                </div>
                <div id="img_area">
                    <img src="${rootContext}/resources/img/dog2.jpg" alt="사진">
                </div>
                <div id="content_area">
                    <a>같이 밥 먹을 친구 구함.</a>
                </div>
                <div id="chat_area">
                    <button> <a>CHAT</a></button>
                </div>
            </div>

            <br><br>

            <div id="feed_box">
                <div id="profile_area">
                    <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                    <div id="profile_box">
                        <div id="profile_name">김본전</div>
                        <div id="profile_nick">라이블리</div>
                    </div>
                </div>
                <div id="img_area">
                    <img src="${rootContext}/resources/img/dog2.jpg" alt="사진">
                </div>
                <div id="content_area">
                    <a>같이 밥 먹을 친구 구함.</a>
                </div>
                <div id="chat_area">
                    <button> <a>CHAT</a></button>
                </div>
            </div>
        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
    

</body>
</html>

 <link rel="stylesheet" href="${rootContext}/resources/css/board/market/market-list.css">
