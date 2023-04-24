<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>

</head>
<header>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
</header>
<body>
	<div id="wrap">

		<main>
		   <h2 align="center">구인구직 상세조회</h2>
  
		   <table>
			  <thead>
				 <tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일시</th>
					<th>조회수</th>
				 </tr>
			  </thead>
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
		</main>
	 </div>
  
	
	
</body>
<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</footer>
</html>