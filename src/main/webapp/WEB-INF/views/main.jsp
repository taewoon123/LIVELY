<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Main</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
		<%--네이버 지도 API--%>
		<script type="text/javascript"
				src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wg4n8e059m"></script>
</head>
<body>

<div id="wrap">
<main>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section class="hero-section" id="section_1">
		<div class="section-overlay"></div>
  
					   <%--구글맵 임베딩--%>
		<div class="container d-flex justify-content-center align-items-center">
		   <div class="video-wrap">
<%--			  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202405.65363635842!2d126.80933302536177!3d37.56476155626408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2012d5c39cf%3A0x7e11eca1405bf29b!2z7ISc7Jq47Yq567OE7Iuc!5e0!3m2!1sko!2skr!4v1682741737668!5m2!1sko!2skr"--%>
<%--							 width="1700vw"--%>
<%--							 height="750px"--%>
<%--					style="border:0;"--%>
<%--					allowfullscreen=""--%>
<%--					loading="lazy"--%>
<%--					referrerpolicy="no-referrer-when-downgrade">--%>
<%--			  </iframe>--%>

				<%--네이버 지도 id는 무조건 map이여야함 && class는 api_position--%>
			<map id="map" class="api_position" style="width:1700vw; height:750px; left: -600px;"></map>
		   </div>
					   <%--구글맵 임베딩 끝--%>
		   <div class="row">
  
			  <div class="col-12 mt-auto mb-5 text-center">
			  </div>
		   </div>
		</div> </section>


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
						<img src="${rootContext}/resources/img/LivelyLogo.png" class="about-image img-fluid">
					</div>
				</div>

			</div>
		</div>
	</section>


	<section class="artists-section section-padding" id="section_3">
		<div class="container">
			<div class="row justify-content-center">

				<div class="col-12 text-center">
					<h2 class="mb-4">Chat</h2>
				</div>

				<div class="chat_img_area">

				
					<div class="col-lg-5 col-12">
						<div class="artists-thumb">
							<div class="artists-image-wrap">
								<img src="${rootContext}/resources/img/chat1.png"
									class="artists-image img-fluid">
							</div>
						</div>
					</div>

					<div class="col-lg-5 col-12">
						<div class="artists-thumb">
							<div class="artists-image-wrap">
								<img src="${rootContext}/resources/img/chat2.png"
									class="artists-image img-fluid">
							</div>
						</div>
					</div>

					<div class="chat_text_area">
						<p>
							<strong>You can easily keep in touch with your friends, neighbours</strong>
						</p>
						<p>
							<strong>Course you can reply them !</strong>
						</p>
					</div>
				</div>

			</div>
		</div>
	</section>


	<section class="schedule-section section-padding" id="section_4">
		<div class="strength_text_area">
			<h2 class="text-white mb-4">Know the real story faster.</h2>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-12 text-center">
						
						<div class="strength">
							<div class="strength_img strength1_img">
								<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M21.9737 11.8281C17.7719 10.4275 13.2293 10.4275 9.0275 11.8281C8.56746 11.9814 8.07022 11.7328 7.91688 11.2728C7.76353 10.8127 8.01215 10.3155 8.47219 10.1622C13.0344 8.64142 17.9668 8.64142 22.529 10.1622C22.989 10.3155 23.2377 10.8127 23.0843 11.2728C22.931 11.7328 22.4337 11.9814 21.9737 11.8281Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M23.041 7.30164C18.2325 5.24085 12.7895 5.24085 7.98096 7.30164C7.53524 7.49266 7.01907 7.28619 6.82805 6.84048C6.63703 6.39477 6.8435 5.8786 7.28921 5.68758C12.5395 3.43747 18.4825 3.43747 23.7327 5.68758C24.1784 5.8786 24.3849 6.39477 24.1939 6.84048C24.0028 7.28619 23.4867 7.49266 23.041 7.30164Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M23.3774 16.1263H6.5005C4.98478 16.1263 3.75605 17.355 3.75605 18.8707V31.2471C3.75605 32.7628 4.98478 33.9916 6.5005 33.9916H23.3774C24.8931 33.9916 26.1218 32.7628 26.1218 31.2471V18.8707C26.1218 17.355 24.8931 16.1263 23.3774 16.1263ZM6.5005 14.3702C4.01494 14.3702 2 16.3852 2 18.8707V31.2471C2 33.7327 4.01494 35.7476 6.5005 35.7476H23.3774C25.8629 35.7476 27.8779 33.7327 27.8779 31.2471V18.8707C27.8779 16.3852 25.8629 14.3702 23.3774 14.3702H6.5005Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M35.4933 19.072L30.9928 21.8045C30.8452 21.8941 30.7551 22.0543 30.7551 22.2269V27.8917C30.7551 28.0643 30.8452 28.2245 30.9928 28.3141L35.4933 31.0466C35.8226 31.2465 36.244 31.0094 36.244 30.6241V19.4945C36.244 19.1092 35.8226 18.8721 35.4933 19.072ZM30.0814 20.3034C29.4094 20.7115 28.999 21.4407 28.999 22.2269V27.8917C28.999 28.6779 29.4094 29.4071 30.0814 29.8152L34.5819 32.5476C36.0816 33.4581 38 32.3785 38 30.6241V19.4945C38 17.7401 36.0816 16.6605 34.5819 17.571L30.0814 20.3034Z" fill="#E73F3A"/>
								<path d="M8.93744 22.6961L7.71387 24.3276V25.5512L9.3453 27.9983C10.161 28.4062 11.874 29.2219 12.2003 29.2219C12.5266 29.2219 14.5115 29.4938 15.4632 29.6297C16.5508 29.3578 18.8076 28.814 19.1339 28.814C19.5416 28.814 21.2914 27.0643 21.5807 26.775L21.581 26.7747C21.9889 26.3669 22.2608 25.6871 22.3967 25.1433L21.9889 23.5119L20.7653 22.2883L17.5025 20.6569C16.4148 20.5209 14.158 20.6569 13.8317 20.6569C13.5054 20.6569 11.5205 21.2007 10.5689 21.4726L8.93744 22.6961Z" stroke="#E10600" stroke-width="0.815716"/>
								<circle cx="14.7919" cy="24.9104" r="2.66396" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M9.96497 22.8768C8.88971 23.6895 8.51337 24.5826 8.51337 25.0594H6.75732C6.75732 23.8486 7.56237 22.4915 8.90613 21.4758C10.2848 20.4338 12.3044 19.6809 14.9487 19.6809V21.437C12.6424 21.437 11.0053 22.0905 9.96497 22.8768Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M19.9198 27.2418C20.9951 26.4291 21.3714 25.536 21.3714 25.0591L23.1274 25.0591C23.1274 26.2699 22.3224 27.6271 20.9786 28.6427C19.5999 29.6847 17.5804 30.4376 14.9361 30.4376L14.9361 28.6816C17.2424 28.6816 18.8795 28.0281 19.9198 27.2418Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M19.9198 22.8768C20.9951 23.6895 21.3714 24.5826 21.3714 25.0594H23.1274C23.1274 23.8486 22.3224 22.4915 20.9786 21.4758C19.5999 20.4338 17.5804 19.6809 14.9361 19.6809V21.437C17.2424 21.437 18.8795 22.0905 19.9198 22.8768Z" fill="#E73F3A"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M9.96497 27.2414C8.88971 26.4287 8.51337 25.5356 8.51337 25.0587L6.75732 25.0587C6.75732 26.2695 7.56237 27.6267 8.90613 28.6423C10.2848 29.6844 12.3044 30.4373 14.9487 30.4373L14.9487 28.6812C12.6424 28.6812 11.0053 28.0277 9.96497 27.2414Z" fill="#E73F3A"/>
								</svg>
							</div>
							<div class="strength_text strength1_text">
								<h6>You can watch real-time live traffic jam of your neighbourhood.</h6>
								<h7>You don't need to check any other weather or traffic map application.</h7>
							</div>
							<div class="strength_img strength2_img">
								<br>
								<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M25 32.9893C32.1738 32.9893 37.9893 27.1738 37.9893 20C37.9893 12.8262 32.1738 7.01067 25 7.01067C17.8262 7.01067 12.0107 12.8262 12.0107 20C12.0107 27.1738 17.8262 32.9893 25 32.9893ZM25 35C33.2843 35 40 28.2843 40 20C40 11.7157 33.2843 5 25 5C16.7157 5 10 11.7157 10 20C10 28.2843 16.7157 35 25 35Z" fill="#FFB000"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M8 6C8 5.44772 8.44772 5 9 5L25 5C25.5523 5 26 5.44771 26 6C26 6.55228 25.5523 7 25 7L9 7C8.44772 7 8 6.55228 8 6Z" fill="#FFB000"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M8 34C8 33.4477 8.44772 33 9 33L26 33C26.5523 33 27 33.4477 27 34C27 34.5523 26.5523 35 26 35L9 35C8.44772 35 8 34.5523 8 34Z" fill="#FFB000"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M1 21C1 20.4477 1.44772 20 2 20L11 20C11.5523 20 12 20.4477 12 21C12 21.5523 11.5523 22 11 22L2 22C1.44772 22 1 21.5523 1 21Z" fill="#FFB000"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M30.5179 13.0672C31.0066 13.3244 31.1943 13.9291 30.937 14.4179L24.9689 25.7574C24.8209 26.0386 24.548 26.2327 24.2339 26.2803C23.9197 26.328 23.6016 26.2234 23.3769 25.9987L19.1991 21.821C18.8086 21.4305 18.8086 20.7973 19.1991 20.4068C19.5897 20.0163 20.2228 20.0163 20.6134 20.4068L23.8312 23.6247L29.1672 13.4864C29.4244 12.9976 30.0291 12.81 30.5179 13.0672Z" fill="#FFB000"/>
								</svg>
							</div>
							<div class="strength_text strength2_text">
								<br>
								<h6>Just send a message to your friends.</h6>
								<h7>Communicate with just by hit the enter!</h7>
							</div>
							<div class="strength_img strength3_img">
								<br>
								<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M5.57693 31.4809C7.13252 31.4809 8.39358 30.2198 8.39358 28.6642C8.39358 27.1086 7.13252 25.8476 5.57693 25.8476C4.02135 25.8476 2.76029 27.1086 2.76029 28.6642C2.76029 30.2198 4.02135 31.4809 5.57693 31.4809ZM5.57693 33.228C8.09742 33.228 10.1407 31.1847 10.1407 28.6642C10.1407 26.1437 8.09742 24.1005 5.57693 24.1005C3.05644 24.1005 1.01318 26.1437 1.01318 28.6642C1.01318 31.1847 3.05644 33.228 5.57693 33.228Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M2.77258 35.4341C2.38966 35.9932 2.10655 36.6898 1.93595 37.4532H9.21989C9.04928 36.6898 8.76618 35.9932 8.38326 35.4341C7.76595 34.5328 6.88681 33.961 5.57792 33.961C4.26903 33.961 3.38989 34.5328 2.77258 35.4341ZM11.0016 37.4532C10.5055 34.6941 8.79319 32.2139 5.57792 32.2139C2.36265 32.2139 0.65033 34.6941 0.154267 37.4532C0.0505489 38.0301 0 38.6192 0 39.2003H11.1558C11.1558 38.6192 11.1053 38.0301 11.0016 37.4532Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M34.4207 31.4811C35.9763 31.4811 37.2373 30.22 37.2373 28.6645C37.2373 27.1089 35.9763 25.8478 34.4207 25.8478C32.8651 25.8478 31.604 27.1089 31.604 28.6645C31.604 30.22 32.8651 31.4811 34.4207 31.4811ZM34.4207 33.2282C36.9412 33.2282 38.9844 31.1849 38.9844 28.6645C38.9844 26.144 36.9412 24.1007 34.4207 24.1007C31.9002 24.1007 29.8569 26.144 29.8569 28.6645C29.8569 31.1849 31.9002 33.2282 34.4207 33.2282Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M31.6168 35.4343C31.2339 35.9934 30.9508 36.6901 30.7802 37.4535H38.0641C37.8935 36.6901 37.6104 35.9934 37.2275 35.4343C36.6102 34.533 35.731 33.9612 34.4222 33.9612C33.1133 33.9612 32.2341 34.533 31.6168 35.4343ZM39.8458 37.4535C39.3497 34.6944 37.6374 32.2141 34.4222 32.2141C31.2069 32.2141 29.4946 34.6944 28.9985 37.4535C28.8948 38.0304 28.8442 38.6194 28.8442 39.2006H40.0001C40.0001 38.6194 39.9495 38.0304 39.8458 37.4535Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M19.9939 8.38039C21.5495 8.38039 22.8106 7.11934 22.8106 5.56375C22.8106 4.00816 21.5495 2.74711 19.9939 2.74711C18.4383 2.74711 17.1773 4.00816 17.1773 5.56375C17.1773 7.11934 18.4383 8.38039 19.9939 8.38039ZM19.9939 10.1275C22.5144 10.1275 24.5577 8.08424 24.5577 5.56375C24.5577 3.04326 22.5144 1 19.9939 1C17.4734 1 15.4302 3.04326 15.4302 5.56375C15.4302 8.08424 17.4734 10.1275 19.9939 10.1275Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M17.1896 12.3335C16.8066 12.8926 16.5235 13.5892 16.3529 14.3526H23.6369C23.4663 13.5892 23.1832 12.8926 22.8003 12.3335C22.1829 11.4322 21.3038 10.8604 19.9949 10.8604C18.686 10.8604 17.8069 11.4322 17.1896 12.3335ZM25.4186 14.3526C24.9225 11.5935 23.2102 9.11328 19.9949 9.11328C16.7796 9.11328 15.0673 11.5935 14.5713 14.3526C14.4675 14.9295 14.417 15.5186 14.417 16.0998H25.5728C25.5728 15.5186 25.5223 14.9295 25.4186 14.3526Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M19.9791 23.8602C19.5353 23.2621 19.3828 22.5638 19.3828 22.0719H21.1299C21.1299 22.2562 21.1989 22.572 21.3822 22.8191C21.5347 23.0246 21.7933 23.2267 22.3219 23.2267C22.8485 23.2267 23.0934 23.0268 23.2357 22.8292C23.41 22.587 23.4767 22.2702 23.4767 22.0719H25.2238C25.2238 22.5497 25.0876 23.2471 24.6535 23.85C24.1873 24.4975 23.418 24.9738 22.3219 24.9738C21.2279 24.9738 20.4537 24.4998 19.9791 23.8602Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M14.9155 23.8502C14.4814 23.2472 14.3452 22.5499 14.3452 22.072H16.0923C16.0923 22.2703 16.159 22.5871 16.3334 22.8293C16.4757 23.0269 16.7205 23.2268 17.2471 23.2268C17.7834 23.2268 18.095 23.0165 18.289 22.7823C18.5113 22.5141 18.5856 22.2034 18.5856 22.072H20.3327C20.3327 22.6167 20.1123 23.3202 19.6342 23.8971C19.1279 24.5081 18.3335 24.9739 17.2471 24.9739C16.1511 24.9739 15.3817 24.4977 14.9155 23.8502Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M24.3636 29.252C25.1622 26.8048 25.4937 23.9223 25.4937 22.072H23.7465C23.7465 23.7713 23.4347 26.4667 22.7027 28.71C22.3358 29.8343 21.8828 30.7837 21.3571 31.4356C20.8382 32.0791 20.3187 32.3543 19.784 32.3543V34.1014C21.0242 34.1014 21.9965 33.4259 22.7171 32.5323C23.431 31.647 23.9652 30.473 24.3636 29.252Z" fill="#39A3F0"/>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M15.5989 29.2706C14.7396 26.8247 14.3452 23.937 14.3452 22.072H16.0923C16.0923 23.7566 16.4586 26.4469 17.2473 28.6915C17.6421 29.8151 18.1225 30.768 18.6703 31.424C19.2135 32.0745 19.7506 32.3543 20.2896 32.3543V34.1014C19.0539 34.1014 18.0696 33.4304 17.3293 32.5438C16.5936 31.6628 16.0282 30.4922 15.5989 29.2706Z" fill="#39A3F0"/>
								<path d="M18.5835 19.0297H21.1274V22.0722H18.5835V19.0297Z" fill="#39A3F0"/>
								<rect x="15.6968" y="28.6147" width="2.01055" height="4.05667" transform="rotate(60 15.6968 28.6147)" fill="#39A3F0"/>
								<rect x="27.3501" y="30.6429" width="2.01055" height="4.05667" transform="rotate(120 27.3501 30.6429)" fill="#39A3F0"/>
								</svg>
							</div>	
							<div class="strength_text strength3_text">
								<br>
								<h6>Keep in connection with your neighbours.</h6>
								<h7>Jump onto the boards. Explore and Discover a Good-homeboy and girl of your neighbourhood.</h7>
							</div>
						</div>
				</div>
			</div>
		</div>
	</section>


	<section class="pricing-section section-padding section-bg" id="section_5">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 col-12 mx-auto customer_area">
					<h2 class="text-center mb-4">Customer Center</h2>
				</div>

				<div class="col-lg-6 col-12">
					<div class="pricing-thumb">
						<div class="d-flex">
							<div>
								<h5>Notice</h5>

								<table>
									<thead>
										<tr>
											<th>No</th>
											<th>Title</th>
											<th>Date</th>
											<th>Views</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${nvoList}" var="nvo" varStatus="loop">
                                       <c:if test="${loop.index < 5}">
                                          <tr>
                                             <td>${nvo.noticeNo}</td>
                                             <td>${nvo.noticeTitle}</td>
                                             <td>${nvo.enrollDate}</td>
                                             <td>${nvo.views}</td>
                                          </tr>
                                       </c:if>
                                    </c:forEach>

									</tbody>
								</table>

								<a class="link-fx-1 color-contrast-higher mt-4" href="${rootContext}/notice/list">
									<div class="bootstrap_more_button">
										<span>more</span>
										<svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
											<g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
												<circle cx="16" cy="16" r="15.5"></circle>
												<line x1="10" y1="18" x2="16" y2="12"></line>
												<line x1="16" y1="12" x2="22" y2="18"></line>
											</g>
										</svg>
									</div>
								</a>
							</div>

							
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-12">
					<div class="pricing-thumb">
						<div class="d-flex">
							<div>
								<h5>QNA</h5>

		                        <table>
		                           <thead>
		                              <tr>
		                                 <th>No</th>
		                                 <th>Title</th>
		                                 <th>Date</th>
		                                 <th>Writer</th>
		                              </tr>
		                           </thead>
		                                 <tbody>
		                                    <c:forEach items="${qvoList}" var="qvo" varStatus="loop">
		                                       <c:if test="${loop.index < 5}">
		                                          <tr>
		                                             <td>${qvo.qnaNo}</td>
		                                             <td>${qvo.qnaTitle}</td>
		                                             <td>${qvo.enrollDate}</td>
		                                             <td>${qvo.writerName}</td>
		                                          </tr>
		                                       </c:if>
		                                    </c:forEach>
		                                 </tbody>
		                              </table>

								<a class="link-fx-1 color-contrast-higher mt-4" href="${rootContext}/qna/list">
									<div class="bootstrap_more_button">
										<span>more</span>
										<svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
											<g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
												<circle cx="16" cy="16" r="15.5"></circle>
												<line x1="10" y1="18" x2="16" y2="12"></line>
												<line x1="16" y1="12" x2="22" y2="18"></line>
											</g>
										</svg>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>


	<section class="contact-section section-padding" id="section_6">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 col-12 mx-auto">
					<!-- <h2 class="text-center mb-4">Interested? Let's talk</h2> -->

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
										   class="form-control" placeholder="Title" required>

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
							<iframe src='https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12661.513516944651!2d127.032909!3d37.498993!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1678893686771!5m2!1sko!2skr' width='100%' height='450' style='border:0;' allowfullscreen='' loading='eager'></iframe>
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
</html>
<link href="${rootContext}/resources/css/common/main.css" rel="stylesheet">
<script src="${rootContext}/resources/js/common/main.js"></script>
