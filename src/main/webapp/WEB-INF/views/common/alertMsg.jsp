<%@ page language="java"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${not empty alertMsg }">
	    <script>
			alert('${sessionScope.alertMsg}');
		</script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>