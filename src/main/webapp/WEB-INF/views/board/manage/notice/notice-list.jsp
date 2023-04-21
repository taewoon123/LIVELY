<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel = "stylesheet" href = "/resource/css/notice/notice.css"> -->

<style>
/* table css */
h2 {
	color: white;
}

th, td {
	color: white;
}

main table {
	width: 600px;
	margin: auto;
	text-align: center;
}

main table td {
	border: 2px solid white;
}

#wrap {
	margin-top: 200px;
	margin-bottom: 100px;
}

/* 버튼 css */
#write_submit {
	outline: none;
	cursor: pointer;
	border: none;
	padding: 0.9rem 2rem;
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	position: relative;
	display: inline-block;
	letter-spacing: 0.05rem;
	font-weight: 700;
	font-size: 17px;
	border-radius: 500px;
	overflow: hidden;
	background: #66ff66;
	color: ghostwhite;
	float: right;
	margin-right: 26%;
	margin-top: 2%;
}

#write_submit span {
	position: relative;
	z-index: 10;
	transition: color 0.4s;
}

#write_submit:hover span {
	color: black;
}

#write_submit::before, #write_submit::after {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 0;
}

#write_submit::before {
	content: "";
	background: #000;
	width: 120%;
	left: -10%;
	transform: skew(30deg);
	transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
}

#write_submit:hover::before {
	transform: translate3d(100%, 0, 0);
}

/* search css */
.container-input {
  position: relative;
}

.input {
  width: 150px;
  padding: 10px 0px 10px 40px;
  border-radius: 9999px;
  border: solid 1px #333;
  transition: all .2s ease-in-out;
  outline: none;
  opacity: 0.8;
  float : right;
  margin-right: 26%
}

.container-input svg {
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translate(0, -50%);
}

.input:focus {
  opacity: 1;
  width: 250px;
}

/* pagenation */

</style>

</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

	<!-- search button -->
	<div class="container-input">
		<input type="text" placeholder="Search" name="text" class="input">
		<svg fill="#000000" width="20px" height="20px" viewBox="0 0 1920 1920"
			xmlns="http://www.w3.org/2000/svg">
    		<path
				d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
				fill-rule="evenodd">
			</path>
		</svg>
	</div>

	<!-- list table -->
	<div id="wrap">

		<main>
			<h2 align="center">공지사항 목록</h2>

			<table>
				<tbody>

					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2023.04.20</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2023.04.20</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2023.04.20</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2023.04.20</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2023.04.20</td>
						<td>1</td>
					</tr>

				</tbody>

			</table>
			
			<!-- 작성 버튼 -->
			<button id = "write_submit">
				<span>write</span>
			</button>
			
		</main>
	</div>
	
	<!-- search -->
	<div class="page-area">
  		<div class="pagination_test">
    		<a class="prev page-numbers_test" href="javascript:;">이전</a>
    		<span aria-current="page" class="page-numbers current">1</span>
    		<a class="page-numbers_test" href="javascript:;">2</a>
    		<a class="page-numbers_test" href="javascript:;">3</a>
    		<a class="page-numbers_test" href="javascript:;">4</a>
    		<a class="page-numbers_test" href="javascript:;">5</a>
    		<a class="page-numbers_test" href="javascript:;">6</a>
    		<a class="page-numbers_test" href="javascript:;">7</a>
    		<a class="page-numbers_test" href="javascript:;">8</a>
    		<a class="page-numbers_test" href="javascript:;">9</a>
    		<a class="page-numbers_test" href="javascript:;">10</a>
    		<a class="next page-numbers_test" href="javascript:;">다음</a>
  		</div>
	</div>
	
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>
