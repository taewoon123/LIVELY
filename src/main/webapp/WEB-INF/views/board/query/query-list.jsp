<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>질문게시판</title>
</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/alertMsg.jsp" %>
</header>

<body>

	<h2>Query</h2>

	<!-- list table -->
	<div id="wrap">

		<main>

			<!-- search button -->
			<div class="container-input">
				<input type="text" placeholder="Search" name="text" class="input">
			</div>

			<br> <br> <br>

			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>작성일시</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>

				<tbody>
					<tr id="first-tr"
						onclick="location.href='${rootContext}/query/detail'">
						<td>1</td>
						<td>회원정보 수정</td>
						<td>2023.05.24</td>
						<td>니꼴라스</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>친구찾기 어떻게 하나요?</td>
						<td>2023.04.24</td>
						<td>오작성</td>
						<td>1</td>
					</tr>
					<tr>
						<td>3</td>
						<td>날씨도 알 수 있나요?</td>
						<td>2023.04.24</td>
						<td>이미주</td>
						<td>9</td>
					</tr>
					<tr>
						<td>4</td>
						<td>무슨생각 하시나요?</td>
						<td>2023.10.24</td>
						<td>구준회</td>
						<td>1</td>
					</tr>
					<tr>
						<td>5</td>
						<td>중고거래 시 네이버페이도 가능한가요?</td>
						<td>2023.04.24</td>
						<td>오미라</td>
						<td>4</td>
					</tr>
				</tbody>
			</table>

			<!-- 작성 버튼 -->
			<button id="write_submit">
				<span> <a class="write-btn" href="${rootContext}/query/write">write</a>
				</span>
			</button>

			<!-- pagenation -->
			<div class="page-area">
				<div class="pagination-custom">
					<a class="prev page-numbers" href="#"> << </a> <span
						aria-current="page" class="page-numbers current">1</span> <a
						class="page-numbers" href="#">2</a> <a class="page-numbers"
						href="#">3</a> <a class="page-numbers" href="#">4</a> <a
						class="page-numbers" href="#">5</a> <a class="page-numbers"
						href="#">6</a> <a class="page-numbers" href="#">7</a> <a
						class="page-numbers" href="#">8</a> <a class="page-numbers"
						href="#">9</a> <a class="page-numbers" href="#">10</a> <a
						class="next page-numbers" href="#"> >> </a>
				</div>
			</div>
			<!-- div page-area end -->

		</main>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>

	</div>
	<!-- div wrap end -->

</body>

</html>
<link rel="stylesheet"
	href="${rootContext}/resources/css/board/help/help-list.css">
<link rel="stylesheet"
	href="${rootContext}/resources/css/common/wrap-style.css" />
<script src="${rootContext}/resources/js/query/query-list.js"></script>