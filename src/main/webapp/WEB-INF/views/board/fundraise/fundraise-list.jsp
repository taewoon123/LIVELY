<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<header>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>

<h2>Fundraise</h2>

<!-- list table -->
<div id="wrap">

    <main>

        <!-- search button -->
        <div class="container-input">
            <input type="text" placeholder="Search" name="text" class="input">
            <svg fill="#000000" width="20px" height="20px"
                 viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z"
                        fill-rule="evenodd">
                </path>
            </svg>
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
            <tr>
                <td>1</td>
                <td>Help Me</td>
                <td>2023.04.26</td>
                <td>강작성</td>
                <td>1</td>
            </tr>
            <tr>
                <td>2</td>
                <td>SOS</td>
                <td>2023.04.26</td>
                <td>오작성</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>WTF</td>
                <td>2023.04.26</td>
                <td>최작성</td>
                <td>1</td>
            </tr>
            <tr>
                <td>4</td>
                <td>Somebody Help</td>
                <td>2023.04.26</td>
                <td>정작성</td>
                <td>1</td>
            </tr>
            <tr>
                <td>5</td>
                <td>HelpHelp</td>
                <td>2023.04.26</td>
                <td>심작성</td>
                <td>1</td>
            </tr>
            </tbody>
        </table>

        <!-- 작성 버튼 -->
        <button id="write_submit">
				<span> <a class="write-btn" href="${rootContext}/help/write">write</a>
				</span>
        </button>

        <!-- pagenation -->
        <div class="page-area">
            <div class="pagination-custom">
                <a class="prev page-numbers" href="help-list"> << </a>
                <span aria-current="page" class="page-numbers current">1</span>
                <a class="page-numbers" href="help-list">2</a>
                <a class="page-numbers" href="help-list">3</a>
                <a class="page-numbers" href="help-list">4</a>
                <a class="page-numbers" href="help-list">5</a>
                <a class="page-numbers" href="help-list">6</a>
                <a class="page-numbers" href="help-list">7</a>
                <a class="page-numbers" href="help-list">8</a>
                <a class="page-numbers" href="help-list">9</a>
                <a class="page-numbers" href="help-list">10</a>
                <a class="next page-numbers" href="help-list"> >> </a>
            </div>
        </div> <!-- div page-area end -->

        <footer>
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
        </footer>

    </main>

</div> <!-- div wrap end -->

</body>
</html>
<link rel="stylesheet" href="${rootContext}/resources/css/board/help/help-list.css">
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css" />