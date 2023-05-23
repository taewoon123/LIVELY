<%@ page language="java" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>내가 올린 피드</title>
    </head>

    <body>

        <div id="wrap">

            <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>

                <main>
                    <div id="search-upload-area">
                        <input text-align="left" placeholder="Search" class="feed_search_input" name="text" type="text">
                        <a class="hidden_button" type="submit" href="">검색</a>
                    </div>

                    <!-- 첫번째 피드 시작 -->
                    <div id="feed_box">
                        <div id="profile_area">
                            <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                            <div id="profile_box">
                                <div id="profile_name">me</div>
                                <div id="profile_nick">밥 친구 구해요</div>
                            </div>
                        </div>
                        <div id="feed-image">
                            <div id="img_area">
                                <!-- Image Slider -->
                                <div id="myCarousel" class="carousel slide">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0"
                                            class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"
                                            aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"
                                            aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="first" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="second" href="${rootContext}/resources/img/bear.png"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="third" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%">
                                            </svg>

                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                        <div id="content_area">
                            <a>같이 밥 먹을 친구 구함.</a>
                        </div>
                        <div id="chat_area">
                            <button onclick="chat();"> <a>CHAT</a></button>
                        </div>
                    </div>
                    <!-- 첫번째 피드 끝 -->

                    <div id="feed_box">
                        <div id="profile_area">
                            <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                            <div id="profile_box">
                                <div id="profile_name">me</div>
                                <div id="profile_nick">진짜 배고픈데</div>
                            </div>
                        </div>
                        <div id="feed-image">
                            <div id="img_area">
                                <!-- Image Slider -->
                                <div id="myCarousel" class="carousel slide">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0"
                                            class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"
                                            aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"
                                            aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="first" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="second" href="${rootContext}/resources/img/bear.png"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="third" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%">
                                            </svg>

                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                        <div id="content_area">
                            <a>근데 로얄캐닌만 먹을거야 <br>
                                로얄캐닌 같이먹을 재벌강쥐친구 구함
                            </a>
                        </div>
                        <div id="chat_area">
                            <button onclick="chat();"> <a>CHAT</a></button>
                        </div>
                    </div>
                    <div id="feed_box">
                        <div id="profile_area">
                            <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                            <div id="profile_box">
                                <div id="profile_name">me</div>
                                <div id="profile_nick">내 털뭉치공 팜</div>
                            </div>
                        </div>
                        <div id="feed-image">
                            <div id="img_area">
                                <!-- Image Slider -->
                                <div id="myCarousel" class="carousel slide">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0"
                                            class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"
                                            aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"
                                            aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="first" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="second" href="${rootContext}/resources/img/bear.png"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="third" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%">
                                            </svg>

                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                        <div id="content_area">
                            <a>고퀄이니까 40에 팝니다</a>
                        </div>
                        <div id="chat_area">
                            <button onclick="chat();"> <a>CHAT</a></button>
                        </div>
                    </div>
                    <div id="feed_box">
                        <div id="profile_area">
                            <div id="profile_img"><img src="${rootContext}/resources/img/bear.png" alt="프로필사진"></div>
                            <div id="profile_box">
                                <div id="profile_name">me</div>
                                <div id="profile_nick">삼성울트라북</div>
                            </div>
                        </div>
                        <div id="feed-image">
                            <div id="img_area">
                                <!-- Image Slider -->
                                <div id="myCarousel" class="carousel slide">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0"
                                            class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"
                                            aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"
                                            aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="first" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="second" href="${rootContext}/resources/img/bear.png"
                                                    width="100%" height="100%" />
                                            </svg>
                                        </div>
                                        <div class="carousel-item">
                                            <svg class="bd-placeholder-img" width="100%" height="100%"
                                                aria-hidden="true" preserveAspectRatio="xMidYMid slice"
                                                focusable="false" viewBox="0 0 3840 2160">
                                                <image class="third" href="${rootContext}/resources/img/dog2.jpg"
                                                    width="100%" height="100%">
                                            </svg>

                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                        <div id="content_area">
                            <a>22013년 출생 램 4GB 100만원에 거져 가져갈 분~</a>
                        </div>
                        <div id="chat_area">
                            <button onclick="chat();"> <a>CHAT</a></button>
                        </div>
                    </div>
                </main>

                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>


    </body>
    <script>
        function chat() {

            let options = "width=500, height=600, top=100,left=500";
            window.open("${rootContext}/chat", "chat", options);

        }

        const search_button = document.querySelector(".feed_search_input");
        search_button.addEventListener("keydown", (event) => {
            if (event.keyCode == 13) {
                event.preventDefault();
                document.querySelector('.hidden_button').click();
            }
        });
    </script>

    </html>

    <link rel="stylesheet" href="${rootContext}/resources/css/board/market/market-list.css">
    <link rel="stylesheet" href="${rootContext}/resources/css/member/my-feed.css">