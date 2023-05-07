<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page language="java" pageEncoding="UTF-8" session="false" %>
		<html>

		<head>
			<title>Lively</title>
		</head>

		<body>
			<div id="wrap">
				<main>

					<header class="site-header">
						<div class="container">
							<div class="row">

								<div class="col-lg-12 col-12 d-flex flex-wrap">
									<p class="d-flex me-4 mb-0">
										<strong class="text-dark">Welcome to LIVELY</strong>
									</p>
								</div>

							</div>
						</div>
					</header>

					<%@include file="/WEB-INF/views/common/header.jsp" %>

						<section class="hero-section" id="section_1">
							<div class="section-overlay"></div>

							<%--구글맵 임베딩--%>
								<div class="container d-flex justify-content-center align-items-center">
									<div class="video-wrap">
										<iframe
											src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202405.65363635842!2d126.80933302536177!3d37.56476155626408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2012d5c39cf%3A0x7e11eca1405bf29b!2z7ISc7Jq47Yq567OE7Iuc!5e0!3m2!1sko!2skr!4v1682741737668!5m2!1sko!2skr"
											width="1700vw" height="750px" style="border:0;" allowfullscreen="" loading="lazy"
											referrerpolicy="no-referrer-when-downgrade">
										</iframe>
									</div>
									<%--구글맵 임베딩 끝--%>
										<div class="row">

											<div class="col-12 mt-auto mb-5 text-center">
												<%-- <small>Festava Live Presents</small>--%>

													<%-- <h1 class="text-white mb-5">Night Live 2023</h1>--%>

														<%-- <a class="btn custom-btn smoothscroll" href="#section_2">Let's begin</a>--%>
											</div>
											<%-- 날짜,위치,공유 디브 --%>
												<%-- <div class="col-lg-12 col-12 mt-auto d-flex flex-column flex-lg-row text-center">--%>
													<%-- <div class="date-wrap">--%>
														<%-- <h5 class="text-white">--%>
															<%-- <i class="custom-icon bi-clock me-2"></i>--%>
																<%-- 10 - 12<sup>th</sup>, Dec 2023--%>
																	<%-- </h5>--%>
																		<%-- </div>--%>

																			<%-- <div class="location-wrap mx-auto py-3 py-lg-0">--%>
																				<%-- <h5 class="text-white">--%>
																					<%-- <i class="custom-icon bi-geo-alt me-2"></i>--%>
																						<%-- National Center, United States--%>
																							<%-- </h5>--%>
																								<%-- </div>--%>

																									<%-- <div class="social-share">--%>
																										<%-- <ul
																											class="social-icon d-flex align-items-center justify-content-center">--%>
																											<%-- <span class="text-white me-3">Share:</span>--%>

																												<%-- <li class="social-icon-item">--%>
																													<%-- <a href="#" class="social-icon-link">--%>
																														<%-- <span class="bi-facebook"></span>--%>
																															<%-- </a>--%>
																																<%-- </li>--%>

																																	<%-- <li class="social-icon-item">--%>
																																		<%-- <a href="#" class="social-icon-link">--%>
																																			<%-- <span class="bi-twitter"></span>--%>
																																				<%-- </a>--%>
																																					<%-- </li>--%>

																																						<%-- <li class="social-icon-item">--%>
																																							<%-- <a href="#"
																																								class="social-icon-link">--%>
																																								<%-- <span
																																									class="bi-instagram"></span>--%>
																																									<%-- </a>--%>
																																										<%-- </li>--%>
																																											<%-- </ul>--%>
																																												<%-- </div>--%>
																																													<%-- </div>--%>
										</div>
								</div>

								<%-- <div class="video-wrap">--%>
									<%-- <video autoplay="" loop="" muted="" class="custom-video" poster="">--%>
										<%-- <source src="video/pexels-2022395.mp4" type="video/mp4">--%>

											<%-- Your browser does not support the video tag.--%>
												<%-- </video>--%>
													<%-- </div>--%>
						</section>


						<section class="about-section section-padding" id="section_2">
							<div class="container">
								<div class="row">

									<div class="col-lg-6 col-12 mb-4 mb-lg-0 d-flex align-items-center">
										<div class="services-info">
											<h2 class="text-white mb-4">About Lively</h2>

											<p class="text-white">언제 어디서든 제공되는 소통서비스 </p>

											<h6 class="text-white mt-4">교통,자연재해 소식을 실시간으로 알 수 있습니다.</h6>

											<p class="text-white">메인페이지에 들어오면 바로 보이는 지도에 교통, 자연재해 소식을 새로고침하지 않고도 실시간으로 노출합니다. 사건이 일어나고 있는 지점을
												지도에 표시하기 때문에 위취정보도 함께 알 수 있습니다. </p>

											<h6 class="text-white mt-4">지역 커뮤니티 서비스</h6>

											<p class="text-white">각 게시판들은 친구찾기,동네중고거래,구인구직,도움요청,질문 등 우리 동네를 이어주는 소통창구 역할을합니다. </p>
										</div>
									</div>

									<div class="col-lg-6 col-12">
										<div class="about-text-wrap">
											<img src="${rootContext}\resources\img\lively-logo.png" class="about-image img-fluid">

										</div>
									</div>

								</div>
							</div>
						</section>

						<section class="artists-section section-padding" id="section_3">
							<div class="container">
								<div class="row justify-content-center">

									<div class="col-12 text-center">
										<h2 class="mb-4">Meet Artists</h1>
									</div>

									<div class="col-lg-5 col-12">
										<div class="artists-thumb">
											<div class="artists-image-wrap">
												<img src="" class="artists-image img-fluid">
											</div>

										</div>
									</div>

									<div class="col-lg-5 col-12">
										<div class="artists-thumb">
											<div class="artists-image-wrap">
												<img src="${rootContext}/WEB-INF/views/member/chat-yw-market.jsp"
													class="artists-image img-fluid">
											</div>

										</div>

										<div class="artists-thumb">
											<img src="${rootContext}WEB-INF/views/member/chat-yw-friend.jsp" class="artists-image img-fluid">

										</div>
									</div>

								</div>
							</div>
						</section>

						<section class="schedule-section section-padding" id="section_4">
							<div class="container">
								<div class="row">

									<div class="col-12 text-center">
										<h2 class="text-white mb-4">기능</h2>

										<div class="table-responsive">
											<table class="schedule-table table table-dark">
												<thead>

												</thead>

												<tbody>
													<tr>

														<td class="table-background-image-wrap pop-background-image">
															<h3>구인구직</h3>

															<div class="section-overlay"></div>
														</td>

														<td style="background-color: #F3DCD4"></td>

														<td class="table-background-image-wrap rock-background-image">
															<h3>중고거래</h3>

															<div class="section-overlay"></div>
														</td>
													</tr>

													<tr>

														<td style="background-color: #ECC9C7"></td>

														<td>
															<h3>실시간 정보</h3>
															<br>
															<p>교통상황</p>
															<p>자연재해</p>
														</td>

														<td style="background-color: #D9E3DA"></td>
													</tr>

													<tr>


														<td class="table-background-image-wrap country-background-image">
															<h3>도움요청</h3>

															<div class="section-overlay"></div>
														</td>

														<td style="background-color: #D1CFC0"></td>

														<td>
															<h3>질문</h3>

														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>

						<section class="pricing-section section-padding section-bg" id="section_5">
							<div class="container">
								<div class="row">

									<div class="col-lg-8 col-12 mx-auto">
										<h2 class="text-center mb-4">Plans, you' love</h2>
									</div>

									<div class="col-lg-6 col-12">
										<div class="pricing-thumb">
											<div class="d-flex">
												<div>
													<h3><small>Early Bird</small> $120</h3>

													<p>Including good things:</p>
												</div>

												<p class="pricing-tag ms-auto">Save up to <span>50%</span></h2>
											</div>

											<ul class="pricing-list mt-3">
												<li class="pricing-list-item">platform for potential customers</li>

												<li class="pricing-list-item">digital experience</li>

												<li class="pricing-list-item">high-quality sound</li>

												<li class="pricing-list-item">standard content</li>
											</ul>

											<a class="link-fx-1 color-contrast-higher mt-4" href="ticket.html">
												<span>Buy Ticket</span>
												<svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
													<g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
														<circle cx="16" cy="16" r="15.5"></circle>
														<line x1="10" y1="18" x2="16" y2="12"></line>
														<line x1="16" y1="12" x2="22" y2="18"></line>
													</g>
												</svg>
											</a>
										</div>
									</div>

									<div class="col-lg-6 col-12 mt-4 mt-lg-0">
										<div class="pricing-thumb">
											<div class="d-flex">
												<div>
													<h3><small>Standard</small> $240</h3>

													<p>What makes a premium festava?</p>
												</div>
											</div>

											<ul class="pricing-list mt-3">
												<li class="pricing-list-item">platform for potential customers</li>

												<li class="pricing-list-item">digital experience</li>

												<li class="pricing-list-item">high-quality sound</li>

												<li class="pricing-list-item">premium content</li>

												<li class="pricing-list-item">live chat support</li>
											</ul>

											<a class="link-fx-1 color-contrast-higher mt-4" href="ticket.html">
												<span>Buy Ticket</span>
												<svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
													<g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
														<circle cx="16" cy="16" r="15.5"></circle>
														<line x1="10" y1="18" x2="16" y2="12"></line>
														<line x1="16" y1="12" x2="22" y2="18"></line>
													</g>
												</svg>
											</a>
										</div>
									</div>

								</div>
							</div>
						</section>

						<section class="contact-section section-padding" id="section_6">
							<div class="container">
								<div class="row">

									<div class="col-lg-8 col-12 mx-auto">
										<h2 class="text-center mb-4">Interested? Let's talk</h2>

										<nav class="d-flex justify-content-center">
											<div class="nav nav-tabs align-items-baseline justify-content-center" id="nav-tab" role="tablist">
												<button class="nav-link active" id="nav-ContactForm-tab" data-bs-toggle="tab"
													data-bs-target="#nav-ContactForm" type="button" role="tab" aria-controls="nav-ContactForm"
													aria-selected="false">
													<h5>Contact Form</h5>
												</button>

												<button class="nav-link" id="nav-ContactMap-tab" data-bs-toggle="tab"
													data-bs-target="#nav-ContactMap" type="button" role="tab" aria-controls="nav-ContactMap"
													aria-selected="false">
													<h5>Google Maps</h5>
												</button>
											</div>
										</nav>

										<div class="tab-content shadow-lg mt-5" id="nav-tabContent">
											<div class="tab-pane fade show active" id="nav-ContactForm" role="tabpanel"
												aria-labelledby="nav-ContactForm-tab">
												<form class="custom-form contact-form mb-5 mb-lg-0" action="#" method="post" role="form">
													<div class="contact-form-body">
														<div class="row">
															<div class="col-lg-6 col-md-6 col-12">
																<input type="text" name="contact-name" id="contact-name" class="form-control"
																	placeholder="Full name" required>
															</div>

															<div class="col-lg-6 col-md-6 col-12">
																<input type="email" name="contact-email" id="contact-email" pattern="[^ @]*@[^ @]*"
																	class="form-control" placeholder="Email address" required>
															</div>
														</div>

														<input type="text" name="contact-company" id="contact-company" class="form-control"
															placeholder="Company" required>

														<textarea name="contact-message" rows="3" class="form-control" id="contact-message"
															placeholder="Message"></textarea>

														<div class="col-lg-4 col-md-10 col-8 mx-auto">
															<button type="submit" class="form-control">Send message</button>
														</div>
													</div>
												</form>
											</div>

											<div class="tab-pane fade" id="nav-ContactMap" role="tabpanel"
												aria-labelledby="nav-ContactMap-tab">
												<iframe class="google-map"
													src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29974.469402870927!2d120.94861466021855!3d14.106066818082482!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd777b1ab54c8f%3A0x6ecc514451ce2be8!2sTagaytay%2C%20Cavite%2C%20Philippines!5e1!3m2!1sen!2smy!4v1670344209509!5m2!1sen!2smy"
													width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
													referrerpolicy="no-referrer-when-downgrade"></iframe>
												<!-- You can easily copy the embed code from Google Maps -> Share -> Embed a map // -->
											</div>
										</div>
									</div>

								</div>
							</div>
						</section>
				</main>

			</div>

		</body>

		</html>
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
			<link rel="stylesheet" href="${rootContext}\resources\css\common\home-yw.css">