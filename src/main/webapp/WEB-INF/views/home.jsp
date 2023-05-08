<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>

<html>
<head>
	<title>Home</title>
</head>
<body>




<div id="wrap">
<main>
	<%@include file="/WEB-INF/views/common/header.jsp"%>


	<section class="hero-section" id="section_1">
		<div class="section-overlay"></div>

							<%--구글맵 임베딩--%>
		<div class="container d-flex justify-content-center align-items-center">
			<div class="video-wrap">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202405.65363635842!2d126.80933302536177!3d37.56476155626408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2012d5c39cf%3A0x7e11eca1405bf29b!2z7ISc7Jq47Yq567OE7Iuc!5e0!3m2!1sko!2skr!4v1682741737668!5m2!1sko!2skr"
									width="1700vw"
									height="750px"
						style="border:0;"
						allowfullscreen=""
						loading="lazy"
						referrerpolicy="no-referrer-when-downgrade">
				</iframe>
			</div>
							<%--구글맵 임베딩 끝--%>
			<div class="row">

				<div class="col-12 mt-auto mb-5 text-center">

				</div>
			</div>
		</div>
	</section>

					<%-- 어바웃 라이블리 --%>
	<section class="about-section section-padding" id="section_2">
		<div class="container">
			<div class="row">

				<div class="col-lg-6 col-12 mb-4 mb-lg-0 d-flex align-items-center">

					<div class="services-info">
						<h2 class="text-white mb-4">All you have to do is</h2>
						<h2 class="text-white mb-4">Live Lively.</h2>

						<p class="text-white">Lively has started from the scratch with the passionate people that brings up the bright idea.</p>
						<p class="text-white">Dive into our idea and Explore the news of your neighbourhood.</p>

						<h6 class="text-white mt-4">What is the special things of Lively?</h6>
						<p class="text-white">We've been waiting for you ask that.</p>
						<p class="text-white">We provide Live-Traffic-News with our own API. No longer needed a Google Maps to check whether the traffic is good or not.</p>
						<p class="text-white">All you need to do to check the traffic status is you just have to open this amazingly fresh-fast Website :)</p>

						<h6 class="text-white mt-4">How do I get my neighbours news?</h6>
						<p class="text-white">You can just jump onto the boards. You can get all the things you needed.</p>
						<p class="text-white">You can buy, sell, job recruiting, getting job, asking for help and even can fundraise!</p>
					</div>
				</div>



				<div class="col-lg-6 col-12">
					<div class="about-text-wrap">
						<img src="${rootContext}/resources/img/spreading-loves.jpg" class="about-image img-fluid">

						<div class="about-text-info d-flex">

							<div class="ms-4">
								<h3>Live Lively!</h3>

								<p class="mb-0">Spread Loves to all over your neighbourhood with us <3</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<%--어바웃 라이블리 끝--%>

		<%-- 채팅기능 자랑	--%>
	<section class="artists-section section-padding" id="section_3">
		<div class="container">
			<div class="row justify-content-center">

				<div class="col-12 text-center">
					<h1 class="text-white mb-4">Meet Neighbours</h1>
				</div>

				<div class="col-lg-5 col-12">
					<div class="artists-thumb">
						<div class="artists-image-wrap">
							<img src="${rootContext}/resources/img/lively-receive.png"
								 class="artists-image img-fluid">
						</div>

						<div class="artists-hover">
							<p>
								<strong>You can easily keep in touch with your friends, neighbours</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-5 col-12">
					<div class="artists-thumb">
						<div class="artists-image-wrap">
							<img src="${rootContext}/resources/img/lively-send.png"
								 class="artists-image img-fluid">
						</div>

						<div class="artists-hover">
							<p>
								<strong>Course you can reply them !</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%-- 채팅기능 자랑 끝	--%>

		<%--기능 자랑 (장점)--%>
	<section class="lively-things-brag">
		<div class="col-12 text-center">
			<h1 class="text-white mb-4">Know the real story faster.</h1>
		</div>
		<div class="brag-container">
			<div class="brag-card">
				<div class="brag-img-div">
						<img src="${rootContext}/resources/img/map.png" alt="map" id="map-img">
				</div>
				<div class="brag-explain-outer">
					<div class="brag-explain">
						<div class="brag-explain-img-outer">
							<img src="${rootContext}/resources/img/camera.png" alt="camera-img"  class="brag-explain-img">
						</div>
					</div>
					<p class="text-black mt-3">You can watch real-time live traffic jam of your neighbourhood.</p>
					<p class="text-black mt-3">You don't need to check any other weather or traffic map application.</p>
					<p class="text-black mt-3"><strong>We'll do it all for you.</strong></p>

					<div class="brag-explain">
						<div class="brag-explain-img-outer">
							<img src="${rootContext}/resources/img/live-chat.png" alt="live-chat" class="brag-explain-img">
						</div>
					</div>
						<p class="text-black mt-4">Just send a message to your friends.</p>
						<p class="text-black mt-4">Communicate with just by hit the enter!</p>

					<div class="brag-explain">
						<div class="brag-explain-img-outer">
							<img src="${rootContext}/resources/img/users.png" alt="users" class="brag-explain-img">
						</div>
					</div>
						<p class="text-black mt-4">Keep in connection with your neighbours.</p>
						<p class="text-black mt-4">Jump onto the boards. Explore and Discover a Good-homeboy and girl of your neighbourhood.</p>
				</div>
			</div>
		</div>
	</section>
<%--공지사항, qna 칸--%>
	<section class="pricing-section section-padding section-bg" id="section_5">
		<div class="notice-qna-div">
			<div class="notice-div">
				<button class="btn">더보기></button>
				<table class="home-board-table">
<%--					<tr>--%>
<%--						<button class="btn">더보기> </button>--%>
<%--					</tr>--%>
					<tr class="home-board-tr">
						<th class="home-board-th">작성자</th>
						<th class="home-board-th">제목</th>
						<th class="home-board-th">작성일시</th>
					</tr>

					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Notice 1</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Notice 2</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Notice 3</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Notice 4</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Notice 5</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>

				</table>
			</div>
			<div class="qna-div">
				<table class="home-board-table">
					<button class="btn">더보기></button>
					<tr class="home-board-tr">
						<th class="home-board-th">작성자</th>
						<th class="home-board-th">제목</th>
						<th class="home-board-th">작성일시</th>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Qna1</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Qna2</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Qna3</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Qna4</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
					<tr class="home-board-tr">
						<td class="home-board-td">Admin</td>
						<td class="home-board-td">This is Qna5</td>
						<td class="home-board-td">2020-02-02</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<%--공지사항, qna 칸끝--%>




			<%--	Contatc Us--%>
	<section class="contact-section section-padding" id="section_6">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 col-12 mx-auto">
					<h2 class="text-center mb-4">Interested? Let's talk</h2>

					<nav class="d-flex justify-content-center">
						<div class="nav nav-tabs align-items-baseline justify-content-center" id="nav-tab"
							 role="tablist">
							<button class="nav-link active" id="nav-ContactForm-tab" data-bs-toggle="tab"
									data-bs-target="#nav-ContactForm" type="button" role="tab"
									aria-controls="nav-ContactForm" aria-selected="false">
								<h5>Contact Form</h5>
							</button>

							<button class="nav-link" id="nav-ContactMap-tab" data-bs-toggle="tab"
									data-bs-target="#nav-ContactMap" type="button" role="tab"
									aria-controls="nav-ContactMap" aria-selected="false">
								<h5>Google Maps</h5>
							</button>
						</div>
					</nav>

					<div class="tab-content shadow-lg mt-5" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-ContactForm" role="tabpanel"
							 aria-labelledby="nav-ContactForm-tab">
							<form class="custom-form contact-form mb-5 mb-lg-0" action="#" method="post"
								  role="form">
								<div class="contact-form-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-12">
											<input type="text" name="contact-name" id="contact-name"
												   class="form-control" placeholder="Full name" required>
										</div>

										<div class="col-lg-6 col-md-6 col-12">
											<input type="email" name="contact-email" id="contact-email"
												   pattern="[^ @]*@[^ @]*" class="form-control"
												   placeholder="Email address" required>
										</div>
									</div>

									<input type="text" name="contact-company" id="contact-company"
										   class="form-control" placeholder="Company" required>

									<textarea name="contact-message" rows="3" class="form-control"
											  id="contact-message" placeholder="Message"></textarea>

									<div class="col-lg-4 col-md-10 col-8 mx-auto">
										<button type="submit" class="form-control">Send message</button>
									</div>
								</div>
							</form>
						</div>

						<div class="tab-pane fade" id="nav-ContactMap" role="tabpanel"
							 aria-labelledby="nav-ContactMap-tab">
							<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3306.3568054391394!2d-118.30062052355821!3d34.0347173731636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c78ab887f64f%3A0x8451cd9905ca3701!2zMTYxNyBXIDI0dGggU3QsIExvcyBBbmdlbGVzLCBDQSA5MDAwNyDrr7jqta0!5e0!3m2!1sko!2skr!4v1683186366000!5m2!1sko!2skr"
									width="770"
									height="450"
									style="border:0;"
									allowfullscreen=""
									loading="lazy"
									referrerpolicy="no-referrer-when-downgrade">
							</iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>


	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</div>


</body>
<link rel="stylesheet" href="${rootContext}/resources/css/common/home-style.css">
</html>
