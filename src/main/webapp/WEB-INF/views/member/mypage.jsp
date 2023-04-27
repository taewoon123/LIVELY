<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/member/mypage-style.css">
<script defer src="/resources/js/mypage-script.js"></script>
<title>Insert title here</title>
</head>
<style>
.reviewBox {
	display: grid;
	text-align: center;
	align-items: center;
	height: 75px;
	border-radius: 10px;
    background-color: rgb(236, 235, 235);
    margin: 25px 0px 40px;
}
.reviewBox1 a {
	color: black;
    text-decoration: none;
}
</style>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="mypage"><h1>MYPAGE</h1></div>
        <div class="tot">
            <div class="profile">
                <div></div>
                <input type="file" class="profileimg" accept="image/*" onchange="previewImage(event)">
                <div class="img"><img src="/resources/img/PROFILE.PNG" class="imgPro"></div>
                <div class="iSide">
                    <div id="grade"><a href=""><h4>GREEN</h4></a></div>
                    <div id="me"><a href="">
                        <a onclick="location.href = '/member/edit';">
                            <button class="cta">
                                <span>김본전님</span>
                                <svg viewBox="0 0 10 15" height="10px" width="10px">
                                <path d="M1,5 L11,5"></path>
                                <polyline points="8 1 12 5 8 9"></polyline>
                                </svg>
                            </button>
                        </a>
                    </a></div>  <!--회원에 따라 등급/이름 달라짐-->
                </div>
            </div>
            <div class="gradeBox">
                <div class="gradename"><h5>리뷰 ${100 - postPaginationVo.totalArticle}개 추가 작성시 SILVER</h5></div>
                <div class="barBox">
                    <div class="barGraph">
                        <div class="label label1"></div>
                        <div class="label label2"></div>
                        <div class="label label3"></div>
                    </div>
                    <div class="barName">
                        <div class="quarter0">GREEN</div>
                        <div class="quarter1">SILVER</div>
                        <div class="quarter2">GOLD</div>
                        <div class="quarter3">VIP</div>
                    </div>
                </div>
            </div>
            <div class="reviewBox">
            <%-- <div class="reviewBox1"><a href="/post/list?page=1"><h4>리뷰 ${postPaginationVo.totalArticle}개</h4></a></div> --%>
            <div class="box">
                <div class="box1 box1-1"><a href="/post/list?page=1"><h4>리뷰 ${postPaginationVo.totalArticle}개</h4></a></div>
                <div class="line">|</div>
                <div class="box1 box1-2"><a href="comment/list?page=1"><h4>댓글 0개</h4></a></div>
                <div class="line">|</div>
                <div class="box1 box1-3"><a href="report/list?page=1"><h4>신고 0개</h4></a></div>
            </div>
            <div class="box2">
                <div class="scraptext"><h3>스크랩</h3></div>
                <div class="scrapbox scrapbox1">
                    <div class="scrap1 scrap1-1"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap1 scrap1-2"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap1 scrap1-3"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                </div>
                <div class="scrapbox scrapbox2">
                    <div class="scrap2 scrap2-1"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap2 scrap2-2"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap2 scrap2-3"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources//good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                </div>
                <div class="scrapbox scrapbox3">
                    <div class="scrap3 scrap3-1"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap3 scrap3-2"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                    <div class="scrap3 scrap3-3"><a href="">
                        <div class="scrapWrap">
                            <div class="scrapTop">
                                <div class="scrapImgBox"><img src="/resources/img/PROFILE.PNG" class="scrapImg1"></div>
                                <div class="scrapName">
                                    <div><h5>김본전</h5></div>
                                    <div><h6>닉네임</h6></div>
                                </div>
                                </div>
                            <div class="scrapBoardImg">
                                <img src="/resources/img/Car.jpg" class="scrapReviewImg1">
                            </div>
                            <div class="score">
                                <div><img src="/resources/img/star.png" class="starAvg"></div>
                                <div><h5>4.5</h5></div>
                            </div>
                            <div class="updown">
                                <div class="goodbox">
                                    <div class="good"><img src="/resources/img/good.png" class="good"></div>
                                    <div class="goodnum"><h5>100</h5></div>
                                </div>
                                <div class="badbox">
                                    <div class="bad"><img src="/resources/img/bad.png" class="bad"></div>
                                    <div class="badnum"><h5>30</h5></div>
                                </div>
                            </div>
                        </div>
                    </a></div>
                </div>
                <div class="more"><button onclick="showD();"><h4>more</h4></button></div>
            </div>
        </div>
        <%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>

    </div>
</body>
</html>